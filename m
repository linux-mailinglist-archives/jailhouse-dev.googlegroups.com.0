Return-Path: <jailhouse-dev+bncBCB7D7MXMMIPXNGJ5ICRUBFJJPULS@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 688578AFFD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 08:36:46 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id l11sf44550798pgc.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 23:36:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565678205; cv=pass;
        d=google.com; s=arc-20160816;
        b=QKgaGkBZUDCDwIK27OR1G3y/Y4B9HcZgnnx/nA3H3fbOcUV7+Z55IupNlT5yinJvOf
         LSnlHINsN6Zz1n/eVtFSZ/dQr90YV/sJxOaQrB6FMQ/jHCWrfGAWI3XpFsZACjTt8rFI
         ikAIeuuoDcxyGNwE/f/ZcrNmhqkEgCPcZSCmRbVOuE3Ljztq1HbrT9sryJZAWhxV32G7
         z5xbQ3yBDMFrIPKWe8v+wGUYCqoeQz8Qk8SGTv3QA/eTxlakjcxVqO5aEEBGMFUIClxn
         FvqfznRBj7TZtxJ5bI2RN/0VnKP4yl4fWN4QvuwlARj42X1AdlgxGom7nZjH0L+6R/lq
         m6PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=h27Tf4kWBS6laSNLERLLaiySpLpsBaM0Wqzg+vg5WXo=;
        b=VbtQkJWQtM6skmC2URps6Y3cBltY9JJBosj210nLnjd1IrRQjEbToSkh4uOpIMQuEJ
         TunkAUuWnnBrN/eZv3f8l/9IlAHAw01DPqV9Dmn5rHWFoQ0my8x84xgYNKcGpbSSrwhe
         ChPFM9RCUIxkFDkVr44txzU+MavwQF42scLMlwtWu6RYgImkedsDJHYuC/AiYN8UjDLF
         CvIL7xjI7giq5ZBy5UP34cT7C1vTbHaswV8SgA6JGISNHG4htEb4sQz9EnWOLBlBF4+p
         NZ8pQ4QQdjkIAXAf3nkAySFY6BBo/ydN7eL9OA9gUHSqnJa5BkQ6mGD0d9cfoQ0Ibm0i
         YzuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="s3Fc/Rlj";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h27Tf4kWBS6laSNLERLLaiySpLpsBaM0Wqzg+vg5WXo=;
        b=STW66HMi92mpRxuALJEXOA9JtuBJGY8qrV5roQTGcobFS1Pj8d0uO0ZjCBSmGc+Qeq
         v0NvtEYloycGtouou4IbySdiRY28YRHkdJUvgPszfbXOOnzjTbpHDITf4074cMZNhCkO
         zeQMyAraGxXNta5oRS5MZSBNPjfnKAqT+bH/rcrnpWKpon7zNI/KNPx01nFnNxP9eKUv
         jsCHrSLQRsBBC66z3b+XdcI/KiaWcW6fTAaFLIyJyo2dNaQOhvKbAwUfwbBNRS703TXF
         /buCGCT43jIbJrGzMwJ+gweh2IPViN1RdVzqoaCdAuaICmZrFN79nL0j4K2EKNhYnZDX
         cF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h27Tf4kWBS6laSNLERLLaiySpLpsBaM0Wqzg+vg5WXo=;
        b=ngF8rm4rYExeZe9WCeeTa4dt5Xdl+FAHcsn8DAYHHnS2wPhtPvyMuxnvlX+nZktkLh
         ShhGsUVm/1k7EWX9sTYlxWP7LxE/U7RlvJOJSb7JOIIC2pnxSgYp0GOsLpsVrNnwliXL
         Izdf4w4h0SiiwQUjg5Q0LSRWRpEO9xxhRr05l5Bz0lzqJhjJGceAHZMnniKr2vhRF2Wi
         wLqAOnPGlh5P3xaSj9Rk1N3J52hL1RqOd7S+uzecWgbK+EgmJW6bhHII4ojEBfd7bHpS
         JsP4mBuQtzTfD0knzB0R+gyEw5R/kVdFTksXvrCgdy/5c3DMbqhllnMDt3ykl1WKJ2u5
         zIWg==
X-Gm-Message-State: APjAAAV9IR9qo//B+ZT1nE9ZvGmpbhTBzkdLW+lMCpiT/Q+0mjNGxKME
	yXvK1Y4Ro0dYACeQsJn61tY=
X-Google-Smtp-Source: APXvYqyZWq9A4bhDlM80KIbm7BNd7tEYucmleyIrm/cNBz94hFGBFLUq/jyxHgPTSK8gNzOCEdFdkA==
X-Received: by 2002:a65:6401:: with SMTP id a1mr33263165pgv.42.1565678204511;
        Mon, 12 Aug 2019 23:36:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:db53:: with SMTP id u19ls163025pjx.3.gmail; Mon, 12
 Aug 2019 23:36:43 -0700 (PDT)
X-Received: by 2002:a17:902:f213:: with SMTP id gn19mr23081plb.152.1565678203431;
        Mon, 12 Aug 2019 23:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565678203; cv=none;
        d=google.com; s=arc-20160816;
        b=sMSX3tQ2UiyI1c9jAWzHvDXTC0Orw9ud3HDXQDk4ibsq6+GgLRvPOeGupAON3xdePP
         DK4lFCg7tiF2BUvqglrKA3Y/FHGb36y8a8rnIU7iqXvnbZe1rk9tfOwpij1bQXQ5XjWN
         Ahq8ZemlOZn6reZ3xzc7UclMP6VgJVe1QIIFgI1Hxe4JLnFzQ+oVGlSIihEc8v2PgDHX
         Tct/677r047sqTWytKbwhyc8x7bQP6w8jkBSO8qJ02pAl+PvWFlXLPlqlKOvU0u+xE2h
         QwixcPoaMi/G5DhGIE2lmV0TiEP7BbGN5tXOAzfMcA3upHgFDBbQNbEhkXDSb1hQD714
         fang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=GiJ/2Kcv2JFabNA9tWy0DVmtvx3q8YkZQsmRsp70IN0=;
        b=XfTJnmdvmabTzC0loc2FodYviBiPYIU/F8hOG7cz0DcdOrQeYXsqlj5ESIfNDo5zl6
         zyyvQYd7isJpEpXs56eQZXKk4yGtDv1K8q1zYJPEzQk7WGkm3ezMt19+VxxcFOl2Hszf
         cKtzyxSna7D8m5ZPvBQDoYiJnf+r47U2Cqq80l4lZWP9Gu6CXYJB48Lq6KCeehWp7xBH
         nZjJUAJuNLblB86vsktN2ecToyNqJJRv+Sk7hw1pRBLsKk7eKE2BZnvDyyegpcdF2jx4
         cxlqpKKuQ7sEHdDP95zMG/iLidJP//mITUVpSgpFvcd+JS3xdVFlF6sOdMcVRhccgA1S
         C/Xg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="s3Fc/Rlj";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id q2si4054267pgq.3.2019.08.12.23.36.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 23:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D6agsV055315;
	Tue, 13 Aug 2019 01:36:42 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D6ag2W060880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Aug 2019 01:36:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 01:36:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 01:36:42 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D6adb2010345;
	Tue, 13 Aug 2019 01:36:40 -0500
Subject: Re: [PATCH v5 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2
 translations
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
 <8e014b47-3eca-68c3-0b9c-3eb5d3265af0@web.de>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <e010184b-7c53-4dc9-52fb-7d801e924a0f@ti.com>
Date: Tue, 13 Aug 2019 12:05:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8e014b47-3eca-68c3-0b9c-3eb5d3265af0@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="s3Fc/Rlj";       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 11/08/19 11:03 PM, Jan Kiszka wrote:
> On 07.08.19 09:55, 'Lokesh Vutla' via Jailhouse wrote:
>> This series adds support for SMMUv3. Stream IDs have been added to the
>> cell config and they need to be specified in the config before a cell
>> can use a stream.
>>
>> The SMMU driver exposes an emulated SMMU to the guests cells by trapping
>> access to the MMIO registers. This is not emulation in the sense that we
>> fully emulate the device top to bottom. The emulation is used to provide=
 an
>> interface to the SMMU that the hypervisor can control to make sure the
>> inmates are not doing anything they should not. The actual translations
>> are done by hardware.
>>
>> The IOMMU definition has been generalised. The AMD and Intel IOMMU
>> drivers have been updated to use this definition. I am not very familiar
>> with these drivers, so please do take a look to make sure the changes
>> are correct and don't create any unwanted problems.
>>
>> Limitations are mentioned in the 5th patch and work left in the 6th
>> patch.
>>
>>
>> Changes since v4:
>> - Start the IOMMU #define values with 1
>> - Dropped a redundant if check in iommu_count_units
>> - Added mmio_register_unmap in smmuv3_cell_exit
>>
>> Lokesh Vutla (1):
>> =C2=A0=C2=A0 arm64: iommu: smmu-v3: Add support for smmu v3 configuratio=
n from
>> =C2=A0=C2=A0=C2=A0=C2=A0 config files
>>
>> Nikhil Devshatwar (3):
>> =C2=A0=C2=A0 iommu: x86: Generalize iommu definition
>> =C2=A0=C2=A0 arm-common: Introduce iommu functionality
>> =C2=A0=C2=A0 core: Add stream id list in the cell config
>>
>> Pratyush Yadav (2):
>> =C2=A0=C2=A0 arm64: iommu: smmu-v3: Add data structure initialization an=
d stage 2
>> =C2=A0=C2=A0=C2=A0=C2=A0 for SMMUv3
>> =C2=A0=C2=A0 arm64: iommu: smmu-v3: Add support for stage 1 translations
>>
>> =C2=A0 configs/x86/f2a88xm-hd3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>> =C2=A0 configs/x86/qemu-x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>> =C2=A0 hypervisor/arch/arm-common/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
>> =C2=A0 hypervisor/arch/arm-common/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0=C2=A0=
 4 +
>> =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 36 +
>> =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 44 +
>> =C2=A0 hypervisor/arch/arm-common/mmu_cell.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 20 +-
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +-
>> =C2=A0 hypervisor/arch/arm64/smmu-v3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1999 ++++++++++++++++=
+
>> =C2=A0 hypervisor/arch/x86/amd_iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +=
-
>> =C2=A0 hypervisor/arch/x86/vtd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 23 +-
>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 3 +
>> =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 5 +-
>> =C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 2 +-
>> =C2=A0 tools/root-cell-config.c.tmpl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +
>> =C2=A0 17 files changed, 2142 insertions(+), 14 deletions(-)
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/iommu.c
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/smmu-v3.c
>>
>=20
> Thanks, updated next with patches 1..5.
>=20
> I still consider 6 too heavy & risky without a noteworthy use cases. You =
are
> migrating the Linux root cell SMMU usage, right? Is booting without that =
support
> tricky or problematic?

Booting without that will cause scatter gather feature for iommus to be bro=
ken.
So it really depends on if we care about this feature.

>=20
> Then, what's the status of MSI remapping? Is this supported by your targe=
t
> hardware? Or are we just dealing with hard-wired SPIs? If we had a gap he=
re, I

hardware already supports hard-wired SPIs.


> would consider that more important than 2-stage SMMU.

Agree. Will see what can be done here.

Thanks and regards,
Lokesh

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e010184b-7c53-4dc9-52fb-7d801e924a0f%40ti.com.
