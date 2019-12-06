# cimiss-python
 CIMISS client for Python

## Installation

### Ubuntu

```bash
sudo apt install -y build-essential libssl-dev libbz2-dev
pip install cimiss-python
```

### Windows

```bash
pip install cimiss-python
```

## Usage

```python
import cimiss

# host 不带http前缀，通常为纯ip地址
client = cimiss.Query(user_id='myuserid', password='mypasswd', host='myhost')

# callAPI_to_array2D
resp_array_2d = client.array_2d(interface_id="getSurfEleByTime",
                                params={'dataCode': "SURF_CHN_MUL_HOR",
                                        'elements': "Station_ID_C,PRE_1h,PRS,RHU,VIS,WIN_S_Avg_2mi,WIN_D_Avg_2mi,Q_PRS",
                                        'times': "20181224000000",
                                        'orderby': "Station_ID_C:ASC",
                                        'limitCnt': "10"}
                                )
# type(resp_array_2d) == pandas.DataFrame


# callAPI_to_gridArray2D
resp_grid = client.grid_array_2d(interface_id="	getNafpEleGridByTimeAndLevelAndValidtime",
                                 params={'dataCode': 'NAFP_FOR_FTM_HIGH_EC_ANEA',
                                         'fcstEle': 'TEM',
                                         'time': '20191206000000',
                                         'fcstLevel': '1000',
                                         'validTime': '0'
                                         }
                                 )
# type(resp_grid) == xarray.DataArray

# callAPI_to_fileList
resp = client.file_list(...)
# type(resp_array_2d) == pandas.DataFrame

# callAPI_to_saveAsFile
client.save_file(...)

# callAPI_to_downFile
client.down_file(...)

```