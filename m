Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7P7VPTAKGQEF7GBCYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3D11B8C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 16:34:38 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id u5sf398245lju.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 07:34:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556807678; cv=pass;
        d=google.com; s=arc-20160816;
        b=GEMK8PGn0nvFg/vqqGffA9lFbqgS1O9O1bb3Wy09M4oJ2qZFnPYvOOuoZGeMw8WQ2l
         cMs57yqDVcVzWTHXtCQQpuYfeFTbRxvbIeylp9cWuKpygk+HEW1DuekadmRQfJBycMzB
         LVpvGOFH70jSG9YCSn47jCKGpT+33bMtFvgVu7XZ6ox4+QjjrtdthVeCadziO+zRc6N+
         rMD5+/MoDgf+QNtxbq0vG64io+jXQgnX70Amgs+xViBI6DmJdzhgcRuo6wD0G6vGjV47
         MIwqbOelLRK01+zmEHnCykjrxkyCfY89le5SCo0MAcRCqYKVBIEsEDO5FTaLgp/ZZYrv
         1Sgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=QRKrOvYhINN/uoTBLm55Dovx92FVYpcJOsEPEBqXc9w=;
        b=tStCar8xvxH0VGcMx0G+4FFb4KRmgNIkqzJ5apnCyRIQ5AqZWEaEbA/5amADTVjBe2
         kXfycO1s8hRMVfHlJY25g60lNTZ8IBtyLK3Rg0Ey2dOoAPTvVm3wwDZW9zSgXX7MWXlg
         voRxJamYQx3sV8wkf2ydqDOL2kkuvuW34+JexQeHWywpLo2194uuXQcm9+qOKMBtoLLY
         gUckmlaL3pxX4KbMo/MJ+n6efc/6I0FVpLhyZA5rr2+SWDPIFGCfPrD375Vpsqj1M7nr
         5LB3lbP3nTLzp5ay5qcivRnNITNtNwzO4KQu4Lsp4hhvY2z9tDHliDG+4QW+Vctosved
         0C0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QBy9gETq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QRKrOvYhINN/uoTBLm55Dovx92FVYpcJOsEPEBqXc9w=;
        b=WlhIsqMmzHeR2V8HuT9IJLiK6At5gbaGbuZoHciuar0kcFgbzTvoakdGCWZrAoMxGf
         wz+RZ5NAu45Ui9ivJj1e4FsfnlGy12kflRiiWIRBrbJkwNiAcSkP8MXFL9UTle+MjyZL
         lbMqssKiHnyahXw742/xx0MAEZUOWj9HIlTN/LLVXRIp7ni+tJzExBipfWSNsYpWvccX
         QwkOdLI8hk89SHsr3dv58R7iVFb5bFU4KjijzdKGpDZrzGkrJ/uRhaCvQw71plQM2LO7
         Mmw3jbbsCK7CaskTuQfRCL/DgNbQ/03l7FzuPdiweUVgs29wUsrYohCNuD8nAOsn08bC
         Wc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QRKrOvYhINN/uoTBLm55Dovx92FVYpcJOsEPEBqXc9w=;
        b=kO3pyFHaK5RvX2FATYNDyAsCSdkd/paXbyaOJFT25KhQ4Rs8zYx6B6pj3DizyKLHu8
         bBQ5h+8Aix+P8LJQ3ZkKaymEiRrUWf+cEdZ8eYZ/SYCMAkmrPsfNbjy712dd/fqLTwmA
         T+5FJud5JC9TP8DXtDgCLsb+FoEVFfZ34thquWlohD1AyQtoy3kEtdnEOd+svBwTbeGH
         vDPilYaK+v6dU1hVsO/4Zisz+rHexOqtCWqaj8AVdH80wIun8BkfjMRFqEA2ZsXmVID6
         qBAJK4moVMcjkWHa7rQsJ6hlYrSzQkDbYkfI/K+LLAA6pG1d5E5WbhvK8qWfmB3hleLI
         W0jA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXPMvfkontC86KlHa1iytLb9DsDFCKJv8AD2w0zh3xUYk6q1dCJ
	v4OLU9QhDom/6CFDbely2vw=
X-Google-Smtp-Source: APXvYqwpJgOU3qX500dXC1m6jr0rv4EXXL0s7GbwrUfiC8FDwxTHTpU+m3ROKHds1plgLvr2c86a6A==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr2153318lji.45.1556807678069;
        Thu, 02 May 2019 07:34:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a286:: with SMTP id k6ls251440lja.4.gmail; Thu, 02 May
 2019 07:34:37 -0700 (PDT)
X-Received: by 2002:a2e:880b:: with SMTP id x11mr1768391ljh.4.1556807677512;
        Thu, 02 May 2019 07:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556807677; cv=none;
        d=google.com; s=arc-20160816;
        b=dbQEg06r7GQI2WB0qP9VTX+/N6oS+OeiEd9DwAEhZRG5MyYZjrYGMIhIfGUcQuDE2k
         l4ydNo7iJ/8ddxIK8/XvSDwJvQhjQe14gx4anUmLHTGhhHRA6rsb1WgjCD6Gr4yl3O+b
         f/IZJ2zUB1hbculUUjM39HCp5Xg8o5g7k/yqbPalJOfpWAwGdu8+ir0mVxMfH12Jk1pC
         9nVw7eAibLnyE+FWG1m9tV+68G5k1vCdlvolE69g8KNeJDjdz7GF0kRYzVWkDOUmS1Km
         UjtFTT4ahZeCPrIF5AL1sfYkrCpS8G24b7vXj8AMwKxJT3GfJ8+zzVouehMWe2Ud/5Dz
         iDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Nu+2KdmOqVcnhQTccNwp5pV5JDa9cCgDD8YkMQVzgA8=;
        b=hAdkLZAzWWt6hMET9p1gFR/OqBZGPYor7w3P6IY625HY9joDzOuV4FD4Qi1n9aNtJs
         3KKAQfRig24aT3cbHI3mpsBTQzu4QK9g11cDhyDvMmQE+MHjgYk3QhRxwMzKtph9rpaD
         d86lTuvLssGWBX+D6uuEHGAckXUfCADyMdYIA5HuOpKyrkmMVUPMay38n+U4OZBeQJpm
         IcH0CCt2TRM8QyJr5I/WZbqvYC1CgH15zCAVZi0UyOFFHzV2BJT/sittCLt5gDD7XiOF
         /o6EPVNxQcf3sqqwAV/5nbVnoBrvf4nsDoZitRR4FAxnwwYwoW72HOVpq9FqaRL8ky2b
         udJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QBy9gETq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id x14si130280ljh.1.2019.05.02.07.34.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44vyT83H6WzyKw;
	Thu,  2 May 2019 16:34:36 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 16:34:36 +0200
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking names
 for PCI caps
To: Henning Schild <henning.schild@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
 <20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
 <ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
 <20190502161442.3e2db927@md1za8fc.ad001.siemens.net>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <a4c5ec84-80f1-3da6-e049-e65e2b51b29b@oth-regensburg.de>
Date: Thu, 2 May 2019 16:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502161442.3e2db927@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QBy9gETq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 5/2/19 4:14 PM, Henning Schild wrote:
> Am Thu, 2 May 2019 12:19:10 +0200
> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> 
>> Hi,
>>
>> On 5/2/19 10:31 AM, Henning Schild wrote:
>>> Hi Ralf,
>>>
>>> redefining the "Enum" seems not too elegant. Did you look into ways
>>> to use the header from python?  
>>
>> Duplicating things is in deed not the most elegant way, but it's the
>> way how we handle other magic constants as well.
>>
>> Didn't yet look at any alternatives.
>>
>>>
>>> The "defines" should be really easy to parse without even using a
>>> special python library. The only real problem might be locating the
>>> header, it would need to be installed when running "installed" or
>>> relative when running "local".  
>>
>> We could create a pyjailhouse/pcicaps.py during compilation phase.
>> Make/sed magic could create the python file from a stub. This is
>> basically the same how we create generated C headers.
>>
>> This would a) autocreate the "Enum" and make it easy to maintain and
>> b) solve the problem when being installed.
>>
>> What do you think about this?
> 
> Not sure the extra make before the first use would be nice or
> acceptable. The python code could be generated inside pip, in which
> case you want to have a solution for non-pip users.

Maybe we're not talking about the same thing.

I'd simply use a small template for the skeleton of the python file, use
sed and friends to fill its content based on C headers and copy it over
to its final destination (e.g., pyjailhouse/pci_caps.py).

There's no overlap with Pip. Pip won't care how this file was generated.

> Maybe generate the python code from the header with pip, if the python
> code is not there fall back to using magic numbers.
> 
> Or we stick with the copy and wait for the first inconsistency to make
> us follow up ;).

Yeah, that's the easiest way. But maybe it's worth sourcing out those
classes to a separate python file in any case.

BTW, there's one nice thing about those python Enums:

They will raise an expection if we get an unknown PCI cap id (which
should never happen, though). If it happens, this gives a hint that we
either lack a definition, or something really odd is going on.

  Ralf

> 
> Henning
> 
>>   Ralf
>>
>>>
>>> Henning
>>>
>>> Am Tue, 30 Apr 2019 23:45:04 +0200
>>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>>>   
>>>> Definitions on C-side are in place, so let the generator produce
>>>> those definitions.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>>  pyjailhouse/sysfs_parser.py   | 79
>>>> +++++++++++++++++++++++++++++++---- tools/root-cell-config.c.tmpl |
>>>> 6 +-- 2 files changed, 72 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/pyjailhouse/sysfs_parser.py
>>>> b/pyjailhouse/sysfs_parser.py index 4bb50605..368714b0 100644
>>>> --- a/pyjailhouse/sysfs_parser.py
>>>> +++ b/pyjailhouse/sysfs_parser.py
>>>> @@ -22,6 +22,8 @@ import struct
>>>>  import os
>>>>  import fnmatch
>>>>  
>>>> +from enum import Enum
>>>> +
>>>>  root_dir = "/"
>>>>  
>>>>  def set_root_dir(dir):
>>>> @@ -542,6 +544,65 @@ class PCIBARs:
>>>>          f.close()
>>>>  
>>>>  
>>>> +class PCI_CAP_ID(Enum):
>>>> +    PM     = 0x01 # Power Management
>>>> +    VPD    = 0x03 # Vital Product Data
>>>> +    MSI    = 0x05 # Message Signalled Interrupts
>>>> +    HT     = 0x08 # HyperTransport
>>>> +    VNDR   = 0x09 # Vendor-Specific
>>>> +    DBG    = 0x0A # Debug port
>>>> +    SSVID  = 0x0D # Bridge subsystem vendor/device ID
>>>> +    SECDEV = 0x0F # Secure Device
>>>> +    EXP    = 0x10 # PCI Express
>>>> +    MSIX   = 0x11 # MSI-X
>>>> +    SATA   = 0x12 # SATA Data/Index Conf.
>>>> +    AF     = 0x13 # PCI Advanced Features
>>>> +
>>>> +    def __str__(self):
>>>> +        return "PCI_CAP_ID_" + self.name
>>>> +
>>>> +
>>>> +class PCI_EXT_CAP_ID(Enum):
>>>> +    ZERO    = 0x00 # ???
>>>> +
>>>> +    ERR     = 0x01 # Advanced Error Reporting
>>>> +    VC      = 0x02 # Virtual Channel Capability
>>>> +    DSN     = 0x03 # Device Serial Number
>>>> +    PWR     = 0x04 # Power Budgeting
>>>> +    RCLD    = 0x05 # Root Complex Link Declaration
>>>> +    RCILC   = 0x06 # Root Complex Internal Link Control
>>>> +    RCEC    = 0x07 # Root Complex Event Collector
>>>> +    MFVC    = 0x08 # Multi-Function VC Capability
>>>> +    VC9     = 0x09 # same as _VC
>>>> +    RCRB    = 0x0A # Root Complex RB?
>>>> +    VNDR    = 0x0B # Vendor-Specific
>>>> +    CAC     = 0x0C # Config Access - obsolete
>>>> +    ACS     = 0x0D # Access Control Services
>>>> +    ARI     = 0x0E # Alternate Routing ID
>>>> +    ATS     = 0x0F # Address Translation Services
>>>> +    SRIOV   = 0x10 # Single Root I/O Virtualization
>>>> +    MRIOV   = 0x11 # Multi Root I/O Virtualization
>>>> +    MCAST   = 0x12 # Multicast
>>>> +    PRI     = 0x13 # Page Request Interface
>>>> +    AMD_XXX = 0x14 # Reserved for AMD
>>>> +    REBAR   = 0x15 # Resizable BAR
>>>> +    DPA     = 0x16 # Dynamic Power Allocation
>>>> +    TPH     = 0x17 # TPH Requester
>>>> +    LTR     = 0x18 # Latency Tolerance Reporting
>>>> +    SECPCI  = 0x19 # Secondary PCIe Capability
>>>> +    PMUX    = 0x1A # Protocol Multiplexing
>>>> +    PASID   = 0x1B # Process Address Space ID
>>>> +    DPC     = 0x1D # Downstream Port Containment
>>>> +    L1SS    = 0x1E # L1 PM Substates
>>>> +    PTM     = 0x1F # Precision Time Measurement
>>>> +
>>>> +    def __str__(self):
>>>> +        id = "0x00"
>>>> +        if self.value != 0:
>>>> +            id = "PCI_EXT_CAP_ID_" + self.name
>>>> +        return id + " | JAILHOUSE_PCI_EXT_CAP"
>>>> +
>>>> +
>>>>  class PCICapability:
>>>>      def __init__(self, id, start, len, flags, content,
>>>> msix_address): self.id = id
>>>> @@ -580,11 +641,12 @@ class PCICapability:
>>>>              msix_address = 0
>>>>              f.seek(cap)
>>>>              (id, next) = struct.unpack('<BB', f.read(2))
>>>> -            if id == 0x01:  # Power Management
>>>> +            id = PCI_CAP_ID(id)
>>>> +            if id == PCI_CAP_ID.PM:
>>>>                  # this cap can be handed out completely
>>>>                  len = 8
>>>>                  flags = PCICapability.RW
>>>> -            elif id == 0x05:  # MSI
>>>> +            elif id == PCI_CAP_ID.MSI:
>>>>                  # access will be moderated by hypervisor
>>>>                  len = 10
>>>>                  (msgctl,) = struct.unpack('<H', f.read(2))
>>>> @@ -593,7 +655,7 @@ class PCICapability:
>>>>                  if (msgctl & (1 << 8)) != 0:  # per-vector masking
>>>> support len += 10
>>>>                  flags = PCICapability.RW
>>>> -            elif id == 0x10:  # Express
>>>> +            elif id == PCI_CAP_ID.EXP:
>>>>                  len = 20
>>>>                  (cap_reg,) = struct.unpack('<H', f.read(2))
>>>>                  if (cap_reg & 0xf) >= 2:  # v2 capability
>>>> @@ -601,7 +663,7 @@ class PCICapability:
>>>>                  # access side effects still need to be analyzed
>>>>                  flags = PCICapability.RD
>>>>                  has_extended_caps = True
>>>> -            elif id == 0x11:  # MSI-X
>>>> +            elif id == PCI_CAP_ID.MSIX:
>>>>                  # access will be moderated by hypervisor
>>>>                  len = 12
>>>>                  (table,) = struct.unpack('<xxI', f.read(6))
>>>> @@ -637,8 +699,9 @@ class PCICapability:
>>>>                            'Extended Capability ID %x' % id)
>>>>                      continue
>>>>  
>>>> +                id = PCI_EXT_CAP_ID(id)
>>>>                  next = version_next >> 4
>>>> -                if id == 0x0010:  # SR-IOV
>>>> +                if id == PCI_EXT_CAP_ID.SRIOV:
>>>>                      len = 64
>>>>                      # access side effects still need to be
>>>> analyzed flags = PCICapability.RD
>>>> @@ -648,7 +711,6 @@ class PCICapability:
>>>>                      flags = PCICapability.RD
>>>>                  f.seek(cap + 4)
>>>>                  content = f.read(len - 4)
>>>> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
>>>>                  caps.append(PCICapability(id, cap, len, flags,
>>>> content, 0)) 
>>>>          f.close()
>>>> @@ -674,9 +736,10 @@ class PCIDevice:
>>>>          self.msix_region_size = 0
>>>>          self.msix_address = 0
>>>>          for c in caps:
>>>> -            if c.id in (0x05, 0x11):
>>>> +            if isinstance(c.id, PCI_CAP_ID) and \
>>>> +               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
>>>>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
>>>> -                if c.id == 0x05:  # MSI
>>>> +                if c.id == PCI_CAP_ID.MSI:
>>>>                      self.num_msi_vectors = 1 << ((msg_ctrl >> 1) &
>>>> 0x7) self.msi_64bits = (msg_ctrl >> 7) & 1
>>>>                  else:  # MSI-X
>>>> diff --git a/tools/root-cell-config.c.tmpl
>>>> b/tools/root-cell-config.c.tmpl index b80d7889..b4d64adf 100644
>>>> --- a/tools/root-cell-config.c.tmpl
>>>> +++ b/tools/root-cell-config.c.tmpl
>>>> @@ -196,11 +196,7 @@ struct {
>>>>  		/* ${comment} */
>>>>  		% endfor
>>>>  		{
>>>> -			% if (c.id & 0x8000) != 0:
>>>> -			.id = ${hex(c.id & 0x7fff)} |
>>>> JAILHOUSE_PCI_EXT_CAP,
>>>> -			% else:
>>>> -			.id = ${hex(c.id)},
>>>> -			% endif
>>>> +			.id = ${c.id},
>>>>  			.start = ${hex(c.start)},
>>>>  			.len = ${c.len},
>>>>  			.flags = ${c.flags},  
>>>   
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
