#!/usr/bin/env python
import os
from setuptools import setup, find_packages

ROOT = os.path.abspath(os.path.dirname(__file__))

with open(os.path.join(ROOT, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='cimiss-python',
    version='0.1.6',
    description='A CIMISS client for python',
    long_description=long_description,
    long_description_content_type='text/markdown',
    license='GPL Licence',
    author='Sonic Young',
    author_email='173976914@qq.com',
    url='https://github.com/So0ni/cimiss-python',
    packages=find_packages(exclude=('demo*',)),
    include_package_data=True,
    install_requires=['zeroc-ice>=3.7', 'numpy>=1.16',
                      'urllib3>=1.24', 'pandas>=0.25', 'xarray>=0.14'],
    python_requires=">=3.6, <4",
    data_files=[
        ('cimiss', [os.path.join('cimiss', 'stub.ice')]),
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "License :: OSI Approved :: GNU General Public License (GPL)",
        "Development Status :: 4 - Beta",
        "Operating System :: OS Independent",
    ],
)
