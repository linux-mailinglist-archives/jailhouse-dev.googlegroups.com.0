Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6GTUX2QKGQEDCKZEGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779D1BDB12
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 13:50:17 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id v6sf663672lfi.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Apr 2020 04:50:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588161017; cv=pass;
        d=google.com; s=arc-20160816;
        b=v35Af/2y8QoiBlPJjDw5WqHWgRF9Z7oYeCrWsmVtdbjuy0Ib96K1nOawvg8IMWeZEL
         h3K7Aq5qv8P5wIDXTAoZKqCc9hQNZ32zoTcNQiT1eJxiZVNIpOUKDZ/l2e5kUsMWC3ZY
         4px+Iqa111BOqs+hYM9Nrd1WJSX4PmmgncgZN0HXWvCredJlELAhEswS6ZBV721UfNYD
         HzqLCwrfPG/fGDQUzxSEsUQ2QhNzQS5db0Gzat9enJN++0XGEv/Pz9R6pJfTy1+2Urk1
         ZpgnE7ZeEmekFi9wcip44yD4IIjggUzf7S5yXOX7QFsiJahaCUJ7XTa/L24bq1LAXMqu
         fLhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=bWuSWd4a6nXmKPjsCBawUm15vO6Y/RZ7gUFEfTqz1pw=;
        b=B0pRqKr/SX5op9Bu2od2ogywk7+lck4h0Lj6wFieAwa2ZDti17cM8jOVqeOAp05AuA
         XNkhJQh/XEthAEVJznQNrCdWLo/4IsJrFH8z4aIREQX/NWk0co0Kv8IAn78XLfV0Gubq
         W/obnLJ5lcfOc614m7fU/2oRGbt6mpCr11BMTI2FM20L6GVl6HdESofvLMvJaxYVacXc
         xgz1juDQn26TZkxhpLnG5vSTAEFT6GfBV0X1yKfmggtZzkn0JV9f8TKGLbiAyVx+lRsT
         4s919iDVh9ZIcXuRmayexx4LMg539fxzu+bhNYQ+wWW3DTSfeFCejLVyxJLYZAlvdvdJ
         7jeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bWuSWd4a6nXmKPjsCBawUm15vO6Y/RZ7gUFEfTqz1pw=;
        b=PK7kS8UDHp6y/xQW5XfFkcR6voKRN75YqNbHSgDpqORmQEgzXKxJjbTNW+vTD//eY1
         KZVJF4fthX36zrVWkwgT4kZX9ZjEYnQTqaubV/0RgLv+Y0bpSsbLmHqlYSLbuD3GvDGE
         5NJ0VN6V3BOQa1DkpgE0Grc9e3K/QAuQIIQBqLiwKhxnIzZ4G1e6vpFqOIwHchaZq/WZ
         kSwzoZWJDaRpKJXyAdRTrCuWRjAXBe4CH+3gkKejNGA5+WoKfFe6UB04KhVYT8bLKO3j
         ue5q3ISOlTsZPq5d7v8a5WjwFZZ2ERstXhgIZLORO4zsOE77956s7k4r6gd/1Tq1n5Ra
         DOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bWuSWd4a6nXmKPjsCBawUm15vO6Y/RZ7gUFEfTqz1pw=;
        b=K70GLYL6qEiL1YW4gU0XH0xl03T/PCeApHTakeoqQLlNJIySrI/MdMkTQ1Fyh4/lvL
         aZysP1CQiEFvrXukXPHoknNKpHib1liEmq9t0T0XCqH3AFwVoXQdP1TsY35hwMFPWrN0
         8dXKYSJqOHG8iOt9He2cMOSAeIYDxAltxrWTfHD3OMTSzOI0HrBcC9bIiQhWRJmXfOhW
         hcVHheLzZuDVsniIIXGCEhpePFt8/LqxsWDVF8+Q0butKwUw6aeglK60r1AZVAeQysRc
         et26O0Dw9KfaQOZqMYoVoH5+OV+VnCgpLaN/reQfU+edqAGcnFK3p4F+pCeJ4r7AuUVL
         8o4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubOdYcr+eMU7tzL2Aq+IvYmLnEM8SYFCcTvTYK0RzEmsdxuQQSu
	XILhHtQ+v3nhxa1lU7wW0Uo=
X-Google-Smtp-Source: APiQypKZd71YqlMXSyQsaWY0oYmQ3AOip85tRAUHqmR7CiJBRUKU2UaYKfVRkvPpjiEgVqaeY3G8BA==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr18919632ljc.292.1588161016832;
        Wed, 29 Apr 2020 04:50:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2002:: with SMTP id s2ls7561274ljo.3.gmail; Wed, 29
 Apr 2020 04:50:15 -0700 (PDT)
X-Received: by 2002:a2e:888f:: with SMTP id k15mr20126883lji.198.1588161015882;
        Wed, 29 Apr 2020 04:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588161015; cv=none;
        d=google.com; s=arc-20160816;
        b=PB9UYTXZJMpkeZl0d4XPgkuTdrwrhesB7cnqTE8GJ0KtlXjNyVzGKaMO1QLl9icjDm
         Zsq3sbDX9HziRFbr3JmCNvNmxOyxKWXiRdssupD5ifVamIQtTbb+ex9/sZJBZxllMQ+6
         cNq3mi4jnN6z1iYU6ufwJB64gtvBejhB/mB5YL6h+U4Eiz2EyWoIBefN8XlzJOobIgyw
         0a0SSsQyQGKb2gDr0/3xzNDaOEeSGGsi18EwajYzAoJZwVW/l6/KoDL5CLRzOKaivh88
         YsBHkKVk6CwAcb8CpzUNzPe1lkVF3HXy3VDDPzg3V5/2UOP87U7un2WDtjOnalw3koH/
         5X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=z4+4mNCyovb8BQlNiH5cURJ7Z53N4DNJspyp/UyOF0I=;
        b=LFSubU3KvtTKERrzxaj8CF9AT9lbeL77idT/Q//j7U6GY7UV2LlyUF4cZkkv9b+C60
         Mtd5RF0SO12RHk8SRV3KACBP3jMiR8kNxjj5TKUV8KSeadPDCyibiSNJc9lFOzJ4kIjY
         Dhjq6ZyBDAEyZ9JKwuOMXsEzfBRHwm3eRpvZ+XtS4vYJJYKPkYAxP0EDjOCVvvf/6o74
         tTOCahXExS2Sx3pX92hDzTRvZTL7tzkBEXSEKaaNxYLXDT+fVvRPeaTGDSLRG40KEnyn
         F4XxguPagAB4Lt97OVnEIy7XSUFFbIIRtXhzJiD56r/hPwZ2f7aZfta3BkNEjhHfZul9
         Ll2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u25si180770ljg.1.2020.04.29.04.50.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 04:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 03TBoE5u020816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Apr 2020 13:50:14 +0200
Received: from [167.87.241.229] ([167.87.241.229])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 03TBoCiB030993;
	Wed, 29 Apr 2020 13:50:13 +0200
Subject: Re: [RFC][PATCH v2 0/3] IVSHMEM version 2 device for QEMU
To: Liang Yan <lyan@suse.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin"
 <mst@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <04fc6cb7-b02d-d8c1-1fdf-6b3c8c211284@suse.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <feedf097-094e-c8db-61e8-8725c6046b9c@siemens.com>
Date: Wed, 29 Apr 2020 13:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <04fc6cb7-b02d-d8c1-1fdf-6b3c8c211284@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 29.04.20 06:15, Liang Yan wrote:
> Hi, All,
> 
> Did a test for these patches, all looked fine.
> 
> Test environment:
> Host: opensuse tumbleweed + latest upstream qemu  + these three patches
> Guest: opensuse tumbleweed root fs + custom kernel(5.5) + related
> uio-ivshmem driver + ivshmem-console/ivshmem-block tools
> 
> 
> 1. lspci show
> 
> 00:04.0 Unassigned class [ff80]: Siemens AG Device 4106 (prog-if 02)
> Subsystem: Red Hat, Inc. Device 1100
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR+ FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
> <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Region 0: Memory at fea56000 (32-bit, non-prefetchable) [size=4K]
> Region 1: Memory at fea57000 (32-bit, non-prefetchable) [size=4K]
> Region 2: Memory at fd800000 (64-bit, prefetchable) [size=1M]
> Capabilities: [4c] Vendor Specific Information: Len=18 <?>
> Capabilities: [40] MSI-X: Enable+ Count=2 Masked-
> Vector table: BAR=1 offset=00000000
> PBA: BAR=1 offset=00000800
> Kernel driver in use: virtio-ivshmem
> 
> 
> 2. virtio-ivshmem-console test
> 2.1 ivshmem2-server(host)
> 
> airey:~/ivshmem/qemu/:[0]# ./ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003
> *** Example code, do not use in production ***
> 
> 2.2 guest vm backend(test-01)
> localhost:~ # echo "110a 4106 1af4 1100 ffc003 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id
> [  185.831277] uio_ivshmem 0000:00:04.0: state_table at
> 0x00000000fd800000, size 0x0000000000001000
> [  185.835129] uio_ivshmem 0000:00:04.0: rw_section at
> 0x00000000fd801000, size 0x0000000000007000
> 
> localhost:~ # virtio/virtio-ivshmem-console /dev/uio0
> Waiting for peer to be ready...
> 
> 2.3 guest vm frontend(test-02)
> need to boot or reboot after backend is done
> 
> 2.4 backend will serial output of frontend
> 
> localhost:~ # virtio/virtio-ivshmem-console /dev/uio0
> Waiting for peer to be ready...
> 
> localhost:~/virtio # ./virtio-ivshmem-console /dev/uio0
> Waiting for peer to be ready...
> Starting virtio device
> device_status: 0x0
> device_status: 0x1
> device_status: 0x3
> device_features_sel: 1
> device_features_sel: 0
> driver_features_sel: 1
> driver_features[1]: 0x13
> driver_features_sel: 0
> driver_features[0]: 0x1
> device_status: 0xb
> queue_sel: 0
> queue size: 8
> queue driver vector: 1
> queue desc: 0x200
> queue driver: 0x280
> queue device: 0x2c0
> queue enable: 1
> queue_sel: 1
> queue size: 8
> queue driver vector: 2
> queue desc: 0x400
> queue driver: 0x480
> queue device: 0x4c0
> queue enable: 1
> device_status: 0xf
> 
> Welcome to openSUSE Tumbleweed 20200326 - Kernel 5.5.0-rc5-1-default+
> (hvc0).
> 
> enp0s3:
> 
> 
> localhost login:
> 
> 2.5 close backend and frontend will show
> localhost:~ # [  185.685041] virtio-ivshmem 0000:00:04.0: backend failed!
> 
> 3. virtio-ivshmem-block test
> 
> 3.1 ivshmem2-server(host)
> airey:~/ivshmem/qemu/:[0]# ./ivshmem2-server -F -l 1M -n 2 -V 2 -P 0x8002
> *** Example code, do not use in production ***
> 
> 3.2 guest vm backend(test-01)
> 
> localhost:~ # echo "110a 4106 1af4 1100 ffc002 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id
> [   77.701462] uio_ivshmem 0000:00:04.0: state_table at
> 0x00000000fd800000, size 0x0000000000001000
> [   77.705231] uio_ivshmem 0000:00:04.0: rw_section at
> 0x00000000fd801000, size 0x00000000000ff000
> 
> localhost:~ # virtio/virtio-ivshmem-block /dev/uio0 /root/disk.img
> Waiting for peer to be ready...
> 
> 3.3 guest vm frontend(test-02)
> need to boot or reboot after backend is done
> 
> 3.4 guest vm backend(test-01)
> localhost:~ # virtio/virtio-ivshmem-block /dev/uio0 /root/disk.img
> Waiting for peer to be ready...
> Starting virtio device
> device_status: 0x0
> device_status: 0x1
> device_status: 0x3
> device_features_sel: 1
> device_features_sel: 0
> driver_features_sel: 1
> driver_features[1]: 0x13
> driver_features_sel: 0
> driver_features[0]: 0x206
> device_status: 0xb
> queue_sel: 0
> queue size: 8
> queue driver vector: 1
> queue desc: 0x200
> queue driver: 0x280
> queue device: 0x2c0
> queue enable: 1
> device_status: 0xf
> 
> 3.5 guest vm frontend(test-02), a new disk is attached:
> 
> fdisk /dev/vdb
> 
> Disk /dev/vdb: 192 KiB, 196608 bytes, 384 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> 
> 3.6 close backend and frontend will show
> localhost:~ # [ 1312.284301] virtio-ivshmem 0000:00:04.0: backend failed!
> 
> 
> 
> Tested-by: Liang Yan <lyan@suse.com>
> 

Thanks for testing this! I'll look into your patch findings.

Jan

> On 1/7/20 9:36 AM, Jan Kiszka wrote:
>> Overdue update of the ivshmem 2.0 device model as presented at [1].
>>
>> Changes in v2:
>>   - changed PCI device ID to Siemens-granted one,
>>     adjusted PCI device revision to 0
>>   - removed unused feature register from device
>>   - addressed feedback on specification document
>>   - rebased over master
>>
>> This version is now fully in sync with the implementation for Jailhouse
>> that is currently under review [2][3], UIO and virtio-ivshmem drivers
>> are shared. Jailhouse will very likely pick up this revision of the
>> device in order to move forward with stressing it.
>>
>> More details on the usage with QEMU were in the original cover letter
>> (with adjustements to the new device ID):
>>
>> If you want to play with this, the basic setup of the shared memory
>> device is described in patch 1 and 3. UIO driver and also the
>> virtio-ivshmem prototype can be found at
>>
>>      http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
>>
>> Accessing the device via UIO is trivial enough. If you want to use it
>> for virtio, this is additionally to the description in patch 3 needed on
>> the virtio console backend side:
>>
>>      modprobe uio_ivshmem
>>      echo "110a 4106 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0
>>
>> And for virtio block:
>>
>>      echo "110a 4106 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
>>
>> After that, you can start the QEMU frontend instance with the
>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>> /dev/vda* as usual.
>>
>> Any feedback welcome!
>>
>> Jan
>>
>> PS: Let me know if I missed someone potentially interested in this topic
>> on CC - or if you would like to be dropped from the list.
>>
>> [1] https://kvmforum2019.sched.com/event/TmxI
>> [2] https://groups.google.com/forum/#!topic/jailhouse-dev/ffnCcRh8LOs
>> [3] https://groups.google.com/forum/#!topic/jailhouse-dev/HX-0AGF1cjg
>>
>> Jan Kiszka (3):
>>    hw/misc: Add implementation of ivshmem revision 2 device
>>    docs/specs: Add specification of ivshmem device revision 2
>>    contrib: Add server for ivshmem revision 2
>>
>>   Makefile                                  |    3 +
>>   Makefile.objs                             |    1 +
>>   configure                                 |    1 +
>>   contrib/ivshmem2-server/Makefile.objs     |    1 +
>>   contrib/ivshmem2-server/ivshmem2-server.c |  462 ++++++++++++
>>   contrib/ivshmem2-server/ivshmem2-server.h |  158 +++++
>>   contrib/ivshmem2-server/main.c            |  313 +++++++++
>>   docs/specs/ivshmem-2-device-spec.md       |  376 ++++++++++
>>   hw/misc/Makefile.objs                     |    2 +-
>>   hw/misc/ivshmem2.c                        | 1085 +++++++++++++++++++++++++++++
>>   include/hw/misc/ivshmem2.h                |   48 ++
>>   include/hw/pci/pci_ids.h                  |    2 +
>>   12 files changed, 2451 insertions(+), 1 deletion(-)
>>   create mode 100644 contrib/ivshmem2-server/Makefile.objs
>>   create mode 100644 contrib/ivshmem2-server/ivshmem2-server.c
>>   create mode 100644 contrib/ivshmem2-server/ivshmem2-server.h
>>   create mode 100644 contrib/ivshmem2-server/main.c
>>   create mode 100644 docs/specs/ivshmem-2-device-spec.md
>>   create mode 100644 hw/misc/ivshmem2.c
>>   create mode 100644 include/hw/misc/ivshmem2.h
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/feedf097-094e-c8db-61e8-8725c6046b9c%40siemens.com.
