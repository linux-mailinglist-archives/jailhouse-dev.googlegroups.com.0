Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIEIVPTAKGQEPQBRHZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 278751170B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 12:19:13 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id l14sf269782lja.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 03:19:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556792352; cv=pass;
        d=google.com; s=arc-20160816;
        b=npupGzS+H3bmqLYgp6zI376iIwMrEEQkE7CugdRsVRnAYwTIdUNckjjddM1yq1AOtG
         MNYUFTL8fw0Qd/HbDAbS3fu5VWZvDmPIDHVu0vmW0D06RlBJSA53Pv9nT7adqRqgMQGK
         NoPHN5H+38wmFuler4pzk6wZffKKfw+np+sJD32xuDxZFhuFpj9HzF9EGOmsx9V2nNtA
         sjt2661soxkQB/Zi7IugsEVhH6Q+XoGmp8HNFSCKB+gNMc9EkVSDFTSCZBIrLy4/VnDC
         jkiBeUVCz2xwm6LHmV/tE6R2/ht5h0NBX8wb1F3cLpPl6/IGgsj+6ZfgcKsWtFEjHUJu
         UW6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=02etjLdsEOoxOwaZzQh3lIgM6cl/ZtNN3HKG5e372gY=;
        b=vyfFrWUYfIreW84kjcmeR0irtrjWtZM+1W6ruw+9JB3H81HHdJEhdJbz4EUxWlMRhK
         55jQ1xjWab5bYTf05AuNn/ldofCYFnXdS0o7JqcpI2ZxIzViXdSOH/VlZdSUk85H97JU
         SCB9AWyLq+IX/o4wl2DeOgFT3SYPZ3eY+AdCA7p81eWN81sA4krWRC2BAxtCPDufOkUZ
         JV8V82/52XCiSptUSB+CX/2rm4YzEWp5TeLEYvQf/lG2HRwZ3JhpwYH6qEUFJegqBYrG
         cX7wM6F/w4ADFL6qXl0B6eVSFsplH0JcDX7gb5JCqGOHxGCM4rrRtNxSp3TicLaF6Awf
         hENw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OZE6s2iy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=02etjLdsEOoxOwaZzQh3lIgM6cl/ZtNN3HKG5e372gY=;
        b=bQEnm3gJO50uZFbqKXs9/3HusgSXkVdcM6UPQbBsfqVYXiolkSwhKAX82ryJ0q2Lju
         yhVmFUcFjEHnAMnvEszAYeeb4U5WOFvaw6LT6JMd7iR5qKaKj/T+aMXZ4eMG4M2QSkEU
         KFmooBbKWnqtHWySrx+jQ3gGbDIKnpZQES1jUuVAi/RtH+9XGIkuXemdWU14o+QQ5WwN
         hlfwEAdn1zzD3N7e3NxqSRvDpDUW4lz11EPdQU3SD7mlQL64a7/Hvk8LjbM6ZK7fsSRH
         HA3E8t/Kzsv3YLcxAdANnTcSlOpqC1cYVFwsstKk0ldMvg1fFxWpHHwNIoygoOKzxLkW
         1lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=02etjLdsEOoxOwaZzQh3lIgM6cl/ZtNN3HKG5e372gY=;
        b=TKf2fvSSOQiI23vXRg7APiP6sZDX+dWwXHB4zv30eDEeyM46JP+aKd5Ba+Ke2ByDfj
         gKC9B49fiCfZZ2M3IlrQgUusDjfaDhcCMrbu8Os2U8lZNgcb5MqgSSPNFevoU+LPIktu
         wNz0kXL3ILfaEz+N6J+yL8UDlit+upQRUDfQy+C/lUhXstNVjodUpjTcSfrKlgkbRV0V
         fPDCCqzgMSyZl6glQ9UdtaA87cJjpl5ZGOkYTd0T5kLZulT76oNsnYmEhoW1Z620aYJM
         TCVaQwRZn4/3BP4puKP7vcLTj7w4IUSiF92lVDDjdxmKuKxXGoDIHqXIw2j5mCZlJTlS
         Q6Qg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNPurpRksf2k/1OERYd6XahSn5KSrQH2OPiU6LweIbx89tOf71
	8BgPajz0yKlYJyfrfZoOPss=
X-Google-Smtp-Source: APXvYqxfOjSMGzwAw4VKjCHn0akt60y71Ya43QhxYMjUfvEGwVEDOc7Q5X7vwnLlgKziaH4Bde+4rw==
X-Received: by 2002:a19:7014:: with SMTP id h20mr1619082lfc.158.1556792352645;
        Thu, 02 May 2019 03:19:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9799:: with SMTP id y25ls164124lji.16.gmail; Thu, 02 May
 2019 03:19:12 -0700 (PDT)
X-Received: by 2002:a2e:89da:: with SMTP id c26mr1425363ljk.186.1556792352126;
        Thu, 02 May 2019 03:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556792352; cv=none;
        d=google.com; s=arc-20160816;
        b=jAt2infvrsS2yhfovn6RjM5jSImEQCEIavqjlJXgTNi2SV6F/NikuHIlFa0RYAPALy
         FL8wsWKg9Yx/p95DrptsKxEQpyV+NS1o0DhrwJJm9Gee/uli7/dLwtMqFT/1BWDk0FZc
         /GljPHieJmVzyd11exM10IvSfFKmsMsjpcb1Utz0HdffJwLjRVUZkzd+bKdWI9+ro7cz
         SqotI6k56s6ndQZLz/1IbJY87hn8KJ7LnCvZoWpvQW7F2ysMwlD1v/5K8OsK5R7NpHZB
         aRQm/J3+OQBMUWp62qPMKK0mk9m8tkMNbRw3xoCHe3JWnfbBLMBIJl7hMupsPVYewi9F
         L4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9VasOBfkWdEMI0FgXrxD1bAh+XsB49lbaQcF+5oX7ug=;
        b=JF4i7PUxshwKOyMm5u3HXFC90PaZKX4i6j1cXUEBrAxOdgTLvJTdFV8bT0+7ie8dBo
         slzd+jlDTXeNifUkZRZQsdjFgenQxBgl9V/cMyUAxL52f74tVBaNSb9iHUM3U9Kcbo+R
         Hw3Gg+7//bmzJFPJZLRW4Hxb9zsS4VCPc2Om93Z7bSy7O/pUdL+VH37SLOlD/jf0PIFy
         phvkjhl7cESLgzq/67i+cS5ePIoMjYRaiiYwS3xmmLfVyEfWRw5Sm+ZXJchKMW3rDY6L
         ioSJODuXyoWp7utzlq5OIQ4xh5GJf2XRSMIMIU1vSi7id3SncBNux/u3jzKkmbvoZTjI
         lrHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OZE6s2iy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id e17si128150ljg.3.2019.05.02.03.19.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 03:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 44vrpR1HTRzyZg;
	Thu,  2 May 2019 12:19:11 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 12:19:10 +0200
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking names
 for PCI caps
To: Henning Schild <henning.schild@siemens.com>
CC: <jailhouse-dev@googlegroups.com>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
 <20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
Date: Thu, 2 May 2019 12:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OZE6s2iy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 5/2/19 10:31 AM, Henning Schild wrote:
> Hi Ralf,
> 
> redefining the "Enum" seems not too elegant. Did you look into ways to
> use the header from python?

Duplicating things is in deed not the most elegant way, but it's the way
how we handle other magic constants as well.

Didn't yet look at any alternatives.

> 
> The "defines" should be really easy to parse without even using a
> special python library. The only real problem might be locating the
> header, it would need to be installed when running "installed" or
> relative when running "local".

We could create a pyjailhouse/pcicaps.py during compilation phase.
Make/sed magic could create the python file from a stub. This is
basically the same how we create generated C headers.

This would a) autocreate the "Enum" and make it easy to maintain and b)
solve the problem when being installed.

What do you think about this?

  Ralf

> 
> Henning
> 
> Am Tue, 30 Apr 2019 23:45:04 +0200
> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> 
>> Definitions on C-side are in place, so let the generator produce those
>> definitions.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py   | 79
>> +++++++++++++++++++++++++++++++---- tools/root-cell-config.c.tmpl |
>> 6 +-- 2 files changed, 72 insertions(+), 13 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 4bb50605..368714b0 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -22,6 +22,8 @@ import struct
>>  import os
>>  import fnmatch
>>  
>> +from enum import Enum
>> +
>>  root_dir = "/"
>>  
>>  def set_root_dir(dir):
>> @@ -542,6 +544,65 @@ class PCIBARs:
>>          f.close()
>>  
>>  
>> +class PCI_CAP_ID(Enum):
>> +    PM     = 0x01 # Power Management
>> +    VPD    = 0x03 # Vital Product Data
>> +    MSI    = 0x05 # Message Signalled Interrupts
>> +    HT     = 0x08 # HyperTransport
>> +    VNDR   = 0x09 # Vendor-Specific
>> +    DBG    = 0x0A # Debug port
>> +    SSVID  = 0x0D # Bridge subsystem vendor/device ID
>> +    SECDEV = 0x0F # Secure Device
>> +    EXP    = 0x10 # PCI Express
>> +    MSIX   = 0x11 # MSI-X
>> +    SATA   = 0x12 # SATA Data/Index Conf.
>> +    AF     = 0x13 # PCI Advanced Features
>> +
>> +    def __str__(self):
>> +        return "PCI_CAP_ID_" + self.name
>> +
>> +
>> +class PCI_EXT_CAP_ID(Enum):
>> +    ZERO    = 0x00 # ???
>> +
>> +    ERR     = 0x01 # Advanced Error Reporting
>> +    VC      = 0x02 # Virtual Channel Capability
>> +    DSN     = 0x03 # Device Serial Number
>> +    PWR     = 0x04 # Power Budgeting
>> +    RCLD    = 0x05 # Root Complex Link Declaration
>> +    RCILC   = 0x06 # Root Complex Internal Link Control
>> +    RCEC    = 0x07 # Root Complex Event Collector
>> +    MFVC    = 0x08 # Multi-Function VC Capability
>> +    VC9     = 0x09 # same as _VC
>> +    RCRB    = 0x0A # Root Complex RB?
>> +    VNDR    = 0x0B # Vendor-Specific
>> +    CAC     = 0x0C # Config Access - obsolete
>> +    ACS     = 0x0D # Access Control Services
>> +    ARI     = 0x0E # Alternate Routing ID
>> +    ATS     = 0x0F # Address Translation Services
>> +    SRIOV   = 0x10 # Single Root I/O Virtualization
>> +    MRIOV   = 0x11 # Multi Root I/O Virtualization
>> +    MCAST   = 0x12 # Multicast
>> +    PRI     = 0x13 # Page Request Interface
>> +    AMD_XXX = 0x14 # Reserved for AMD
>> +    REBAR   = 0x15 # Resizable BAR
>> +    DPA     = 0x16 # Dynamic Power Allocation
>> +    TPH     = 0x17 # TPH Requester
>> +    LTR     = 0x18 # Latency Tolerance Reporting
>> +    SECPCI  = 0x19 # Secondary PCIe Capability
>> +    PMUX    = 0x1A # Protocol Multiplexing
>> +    PASID   = 0x1B # Process Address Space ID
>> +    DPC     = 0x1D # Downstream Port Containment
>> +    L1SS    = 0x1E # L1 PM Substates
>> +    PTM     = 0x1F # Precision Time Measurement
>> +
>> +    def __str__(self):
>> +        id = "0x00"
>> +        if self.value != 0:
>> +            id = "PCI_EXT_CAP_ID_" + self.name
>> +        return id + " | JAILHOUSE_PCI_EXT_CAP"
>> +
>> +
>>  class PCICapability:
>>      def __init__(self, id, start, len, flags, content, msix_address):
>>          self.id = id
>> @@ -580,11 +641,12 @@ class PCICapability:
>>              msix_address = 0
>>              f.seek(cap)
>>              (id, next) = struct.unpack('<BB', f.read(2))
>> -            if id == 0x01:  # Power Management
>> +            id = PCI_CAP_ID(id)
>> +            if id == PCI_CAP_ID.PM:
>>                  # this cap can be handed out completely
>>                  len = 8
>>                  flags = PCICapability.RW
>> -            elif id == 0x05:  # MSI
>> +            elif id == PCI_CAP_ID.MSI:
>>                  # access will be moderated by hypervisor
>>                  len = 10
>>                  (msgctl,) = struct.unpack('<H', f.read(2))
>> @@ -593,7 +655,7 @@ class PCICapability:
>>                  if (msgctl & (1 << 8)) != 0:  # per-vector masking
>> support len += 10
>>                  flags = PCICapability.RW
>> -            elif id == 0x10:  # Express
>> +            elif id == PCI_CAP_ID.EXP:
>>                  len = 20
>>                  (cap_reg,) = struct.unpack('<H', f.read(2))
>>                  if (cap_reg & 0xf) >= 2:  # v2 capability
>> @@ -601,7 +663,7 @@ class PCICapability:
>>                  # access side effects still need to be analyzed
>>                  flags = PCICapability.RD
>>                  has_extended_caps = True
>> -            elif id == 0x11:  # MSI-X
>> +            elif id == PCI_CAP_ID.MSIX:
>>                  # access will be moderated by hypervisor
>>                  len = 12
>>                  (table,) = struct.unpack('<xxI', f.read(6))
>> @@ -637,8 +699,9 @@ class PCICapability:
>>                            'Extended Capability ID %x' % id)
>>                      continue
>>  
>> +                id = PCI_EXT_CAP_ID(id)
>>                  next = version_next >> 4
>> -                if id == 0x0010:  # SR-IOV
>> +                if id == PCI_EXT_CAP_ID.SRIOV:
>>                      len = 64
>>                      # access side effects still need to be analyzed
>>                      flags = PCICapability.RD
>> @@ -648,7 +711,6 @@ class PCICapability:
>>                      flags = PCICapability.RD
>>                  f.seek(cap + 4)
>>                  content = f.read(len - 4)
>> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
>>                  caps.append(PCICapability(id, cap, len, flags,
>> content, 0)) 
>>          f.close()
>> @@ -674,9 +736,10 @@ class PCIDevice:
>>          self.msix_region_size = 0
>>          self.msix_address = 0
>>          for c in caps:
>> -            if c.id in (0x05, 0x11):
>> +            if isinstance(c.id, PCI_CAP_ID) and \
>> +               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
>>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
>> -                if c.id == 0x05:  # MSI
>> +                if c.id == PCI_CAP_ID.MSI:
>>                      self.num_msi_vectors = 1 << ((msg_ctrl >> 1) &
>> 0x7) self.msi_64bits = (msg_ctrl >> 7) & 1
>>                  else:  # MSI-X
>> diff --git a/tools/root-cell-config.c.tmpl
>> b/tools/root-cell-config.c.tmpl index b80d7889..b4d64adf 100644
>> --- a/tools/root-cell-config.c.tmpl
>> +++ b/tools/root-cell-config.c.tmpl
>> @@ -196,11 +196,7 @@ struct {
>>  		/* ${comment} */
>>  		% endfor
>>  		{
>> -			% if (c.id & 0x8000) != 0:
>> -			.id = ${hex(c.id & 0x7fff)} |
>> JAILHOUSE_PCI_EXT_CAP,
>> -			% else:
>> -			.id = ${hex(c.id)},
>> -			% endif
>> +			.id = ${c.id},
>>  			.start = ${hex(c.start)},
>>  			.len = ${c.len},
>>  			.flags = ${c.flags},
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
