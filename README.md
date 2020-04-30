# cimiss-python
 CIMISS client for Python 3

## Installation

> Python >= 3.6

### Ubuntu

```bash
sudo apt install -y build-essential libssl-dev libbz2-dev
pip install cimiss-python
```

### Windows

```bash
pip install cimiss-python
```

### CentOS


```bash
sudo yum groupinstall "Development Tools"
sudo yum -y install zlib-devel bzip2-devel openssl-devel
pip install cimiss-python
```

## Usage

> CIMISS-MUSIC仅为内网用户提供服务，且需要拥有相应数据访问权限的账号。

```python
import cimiss
import numpy as np

# host 不带http前缀，通常为纯ip地址  (client实例使用完成后需要调用destroy方法手动注销，或者使用下面的with语句自动管理)
client = cimiss.Query(user_id='myuserid', password='mypasswd', host='myhost')


# callAPI_to_array2D
# array_2d(interface_id: str, params: Dict[str, str], dtypes: Optional[Dict[str, Union[str, np.dtype]]]) -> pd.DataFrame
resp_array_2d = client.array_2d(
    interface_id="getSurfEleByTime",
    params={
        "dataCode": "SURF_CHN_MUL_HOR",
        "elements": "Station_ID_C,PRE_1h,PRS",
        "times": "20181224000000",
        "orderby": "Station_ID_C:ASC",
        "limitCnt": "10",
    },
    dtypes={'PRE_1h': np.float, 'PRS': np.float}
)
# pandas
# https://pandas.pydata.org/pandas-docs/stable/
# dtypes参数字典value也可为字符串 例如 {'PRE_1h': 'float', 'PRS': 'float32'}


# callAPI_to_gridArray2D
# grid_array_2d(interface_id: str, params: Dict[str, str]) -> xr.DataArray
resp_grid = client.grid_array_2d(
    interface_id="getNafpEleGridByTimeAndLevelAndValidtime",
    params={
        "dataCode": "NAFP_FOR_FTM_HIGH_EC_ANEA",
        "fcstEle": "TEM",
        "time": "20191206000000",
        "fcstLevel": "1000",
        "validTime": "0",
    },
)
# xarray
# http://xarray.pydata.org/en/stable/


# callAPI_to_fileList
# def file_list(interface_id: str, params: Dict[str, str]) -> pd.DataFrame


# callAPI_to_saveAsFile
# save_file(interface_id: str, params: Dict[str, str], data_format: str, file_name: str, follow_host: Union[bool, str] = False) -> str
# follow_host可以为bool或str
#   False时使用接口返回的默认下载主机
#   True时则下载主机强行跟随host:80
#   str时则为指定的主机 (x.x.x.x:x 形式 端口为80时可省略端口)

# callAPI_to_downFile
# down_file(interface_id: str, params: Dict[str, str], file_dir: str, follow_host: Union[bool, str] = False) -> List[str]#
 
# 实例使用完成后需要进行注销
client.destroy()
```

> 除此之外还可以使用with语句自动管理

```python
import cimiss

with cimiss.Query(user_id='myuserid', password='mypasswd', host='myhost') as client:
    # client.array_2d ......
    pass

# 在with语句块之外会自动对实例进行注销,无需手动管理
```

## FAQ

> A: `IcePy.cpython-36m-x86_64-linux-gnu.so: undefined symbol: SSLeay`

Q: Update the system OpenSSL library version to 1.1.x (升级系统OpenSSL依赖库版本)
