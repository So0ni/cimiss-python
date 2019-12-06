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

> 未经验证

```bash
yum groupinstall "Development Tools"
yum -y install zlib-devel bzip2-devel openssl-devel
pip install cimiss-python
```

## Usage

> CIMISS-MUSIC仅为内网用户提供服务，且需要拥有相应数据访问权限的账号。

```python
import cimiss

# host 不带http前缀，通常为纯ip地址
client = cimiss.Query(user_id='myuserid', password='mypasswd', host='myhost')


# callAPI_to_array2D
# array_2d(interface_id: str, params: Dict[str, str]) -> pd.DataFrame
resp_array_2d = client.array_2d(interface_id="getSurfEleByTime",
                                params={'dataCode': "SURF_CHN_MUL_HOR",
                                        'elements': "Station_ID_C,PRE_1h,PRS,RHU,VIS,WIN_S_Avg_2mi,WIN_D_Avg_2mi,Q_PRS",
                                        'times': "20181224000000",
                                        'orderby': "Station_ID_C:ASC",
                                        'limitCnt': "10"}
                                )
# pandas
# https://pandas.pydata.org/pandas-docs/stable/


# callAPI_to_gridArray2D
# grid_array_2d(interface_id: str, params: Dict[str, str]) -> xr.DataArray
resp_grid = client.grid_array_2d(interface_id="	getNafpEleGridByTimeAndLevelAndValidtime",
                                 params={'dataCode': 'NAFP_FOR_FTM_HIGH_EC_ANEA',
                                         'fcstEle': 'TEM',
                                         'time': '20191206000000',
                                         'fcstLevel': '1000',
                                         'validTime': '0'
                                         }
                                 )
# xarray
# http://xarray.pydata.org/en/stable/


# callAPI_to_fileList
# def file_list(interface_id: str, params: Dict[str, str]) -> pd.DataFrame


# callAPI_to_saveAsFile
# save_file(interface_id: str, params: Dict[str, str], data_format: str, file_name: str) -> str


# callAPI_to_downFile
# down_file(interface_id: str, params: Dict[str, str], file_dir: str) -> List[str]#

```