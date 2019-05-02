Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBXMDVTTAKGQEDNCIAZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id BD15611BA9
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 16:42:37 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id u26sf408902lje.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 07:42:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556808157; cv=pass;
        d=google.com; s=arc-20160816;
        b=PkVnj60X+rD1usuhlzWwLE7qlw3EQ6r/oKTvScBYWgoUSw/FeLP0Mr8wfm6tlDt1Ls
         zYUVf1N8W8kWFpdIBu4a9iuqeINitdHydLrqhgPYSFYCLL9qezuGugmKGqxr2xWmLBBF
         C+HSt8BYCvNKzxqv2apJuV0Uu7RvqNxY1OznRyBdNg8zunXCmkCoFXaa+TdXD+r2lQqk
         myXCHgAOAcB/M+71jevwNvnPIy7gHZS9PjBdT31ecBRqFfTrOt7KXJzmcfw2JlXgiGrr
         NpQePOtj2AMXDCVkSbYYaOOmBFIZRTWe64igqqNP/D8vgnifI1noTANrYaKA29TBP4pY
         0Pmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=jinLjMA5APPDMKbn2w6ZuR5UAfW3K9fUA/R1/dvb/6Q=;
        b=Xw0ZeHLL2LMCJ8ENMjZRgIevHDe032dhl+xgOGJSv9HMSezdkqnkCe1BVi/WebAbqz
         nHj5DOdre9n9GJvvqPKoX3XVga0uE9PweYvCoMdPc804/65S3o/wskejVE497LRf8LKK
         eShIef/kQhFQthNkZbYYw3Kh4/KCK6p8bHbbutKaevbKufx+PQiliL0Q+h7gm/8jkEuG
         92xGOU10HhsGgrjiyPY+4qWwBthBGu2gYizDPz8ZuoJ6d6WJSITPYGfoW1htC4lqaaZm
         BNHRkP2AOQwQ013KvSNF/YHNF0//i0Tds9cTj4DloxEtfFfEYi4Kxt3HPKpDlB/Bp1YQ
         TbDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jinLjMA5APPDMKbn2w6ZuR5UAfW3K9fUA/R1/dvb/6Q=;
        b=OXIRXYjkDfYaPN+oR0M5SF3HBeoY1r/1Xld/1E5mZSxVca6hBfK4X0gU3Z06miDzl+
         1uFMKjQ44+GxM3kGW6xQq/TAN7lKSGsJFy6VFbLMBe+g821i2KX97H89Zhqt+w6NmZRc
         ldOWCl8zOrIEKCp9tUdfwFI8G2g4t6V5HWi+/6GsXNWacibAI6BGdHqZCJRZwCcn+TFs
         PLhahB96uxOQuc6A84SsWboXXsh2B7/1EwlRUbAWO/meaCpuLlaKxQqOUjLZDQwP04KM
         e5ZMhsri/KLRlKB03PlfArH/27n2eGtw/Kyh23jOW5F8BeYN2xv0+yK5u49JYCGHzPxN
         HhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jinLjMA5APPDMKbn2w6ZuR5UAfW3K9fUA/R1/dvb/6Q=;
        b=XE3eBO5TUa9o89GE3nB5mHli1h/ia1MCH3YsDqMXYGejE7OWcMaaxR6Wd32Mt11b4f
         84bZ3XSKu9i/jfI0u9OhiCA5TYidsAmni0OS3q8YEbQdfeqwa1ZMgXUb8n695L2u1JOP
         C/oVf0VYbp2NiB9yKjWWPqpAYwuawrIUGd7ICaYT44JbSUnIRw4GpPpd+sp/u4bQJRB2
         Dmt/JmOv4igAga25HSxxq3lEmmyMYIhF7q4SZ0a72BMzXPdwEZbQOtXe5zy7MV5Ejkig
         MnSUHldDP9gePV294cOepJBnjrCTgyUxPPqg1B7wZKOBCTurG2Fs44EdgCPXShv9jAoB
         9nyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbyFTjMwoHFXQG7m0ACcc02cBwGLVKdmqYLP8o/k7KskW1VrTe
	CjYO7n3N1jlO1fPJf8MrIco=
X-Google-Smtp-Source: APXvYqxqCFI64BPbKKIiTEcPjmlnlIQfGlQ2MJ5dUvI1Brp0mhDmxbvPXiA40WiTxnfrK375XUG+fA==
X-Received: by 2002:a19:4a04:: with SMTP id x4mr2216928lfa.124.1556808157294;
        Thu, 02 May 2019 07:42:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c88:: with SMTP id x8ls254901lji.1.gmail; Thu, 02 May
 2019 07:42:36 -0700 (PDT)
X-Received: by 2002:a2e:9a8f:: with SMTP id p15mr2153221lji.191.1556808156659;
        Thu, 02 May 2019 07:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556808156; cv=none;
        d=google.com; s=arc-20160816;
        b=lfqeOCh+fxg0S6Xh2PGnivgVVCXAFZACvIOXbmUuPa3rgoPrvbD+Lk5CHp4ZjDXIjJ
         XkLLR3SDkOVTKnU6alIk6DIfNOFOuar2xNHFWKESCx5jwzjoC8H/3GMQ/c75fwaJ9zSO
         wB0ctZcHSlMsTKTHkuYttkm+TFbTU20T2K1y6N0VPVTQT4zDQGK8PrhHrrTG+P0i57B+
         nOjswNE86yWchfRHGalLw4r0zGneGhsBCu4ZCP2tVSX9IlP12FLiJ1LQn8pgVzYSk9ct
         l9sT2unO1R27Mfu1jXYdiitp5wXT6LLiHg+KBXO/+A2ZpoxvlrJQG/LKs5OK0Ojh3L0G
         No8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=c8KXMSrZOixD1BmGWexLfeE2Gw8yiRyBwtnUDRmstQU=;
        b=mjbbaql0uW9WCo0XfHkv+sTtNebNcUCMO7woDE3gXd5zCeCa2h4eDzOVQQ7lPXxAjY
         e0cQdawOZwYsU1bO0spsH42L8/eE3rdajeqo4CZWDMujIhqdJtlrLBUnruhi1rfbOi9j
         wyxHHufy6Ts2ASZzrcPN3GwDpLzeerPROpJzbDW6BSRNM42eBg4Frn6XnYhgunZYNX6C
         qs+iBrJPqGN4sp+Pt6JgPmCJ7s9WoQ1CpsZDCWzEsPlOSuSJ6LUA3FWezmK3YxULPsCD
         BmHkBikxd6JvBQa8hK0lTEroDGnFE98aawmjXQLENhSgwhx0F8/f8Tjkh6LDAWzP2H6t
         XEiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id u30si1368357lfn.4.2019.05.02.07.42.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x42EgZst010174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2019 16:42:35 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x42EgZfH011486;
	Thu, 2 May 2019 16:42:35 +0200
Date: Thu, 2 May 2019 16:42:34 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking
 names for PCI caps
Message-ID: <20190502164234.722bf585@md1za8fc.ad001.siemens.net>
In-Reply-To: <a4c5ec84-80f1-3da6-e049-e65e2b51b29b@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
	<20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
	<20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
	<ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
	<20190502161442.3e2db927@md1za8fc.ad001.siemens.net>
	<a4c5ec84-80f1-3da6-e049-e65e2b51b29b@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com
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

Am Thu, 2 May 2019 16:34:35 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> On 5/2/19 4:14 PM, Henning Schild wrote:
> > Am Thu, 2 May 2019 12:19:10 +0200
> > schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> >   
> >> Hi,
> >>
> >> On 5/2/19 10:31 AM, Henning Schild wrote:  
> >>> Hi Ralf,
> >>>
> >>> redefining the "Enum" seems not too elegant. Did you look into
> >>> ways to use the header from python?    
> >>
> >> Duplicating things is in deed not the most elegant way, but it's
> >> the way how we handle other magic constants as well.
> >>
> >> Didn't yet look at any alternatives.
> >>  
> >>>
> >>> The "defines" should be really easy to parse without even using a
> >>> special python library. The only real problem might be locating
> >>> the header, it would need to be installed when running
> >>> "installed" or relative when running "local".    
> >>
> >> We could create a pyjailhouse/pcicaps.py during compilation phase.
> >> Make/sed magic could create the python file from a stub. This is
> >> basically the same how we create generated C headers.
> >>
> >> This would a) autocreate the "Enum" and make it easy to maintain
> >> and b) solve the problem when being installed.
> >>
> >> What do you think about this?  
> > 
> > Not sure the extra make before the first use would be nice or
> > acceptable. The python code could be generated inside pip, in which
> > case you want to have a solution for non-pip users.  
> 
> Maybe we're not talking about the same thing.
> 
> I'd simply use a small template for the skeleton of the python file,
> use sed and friends to fill its content based on C headers and copy
> it over to its final destination (e.g., pyjailhouse/pci_caps.py).

I see, have a generated copy in the tree instead of just shipping the
generator. Reminds me of autotools and make ;).

Henning

> There's no overlap with Pip. Pip won't care how this file was
> generated.
> 
> > Maybe generate the python code from the header with pip, if the
> > python code is not there fall back to using magic numbers.
> > 
> > Or we stick with the copy and wait for the first inconsistency to
> > make us follow up ;).  
> 
> Yeah, that's the easiest way. But maybe it's worth sourcing out those
> classes to a separate python file in any case.
> 
> BTW, there's one nice thing about those python Enums:
> 
> They will raise an expection if we get an unknown PCI cap id (which
> should never happen, though). If it happens, this gives a hint that we
> either lack a definition, or something really odd is going on.
> 
>   Ralf
> 
> > 
> > Henning
> >   
> >>   Ralf
> >>  
> >>>
> >>> Henning
> >>>
> >>> Am Tue, 30 Apr 2019 23:45:04 +0200
> >>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> >>>     
> >>>> Definitions on C-side are in place, so let the generator produce
> >>>> those definitions.
> >>>>
> >>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> >>>> ---
> >>>>  pyjailhouse/sysfs_parser.py   | 79
> >>>> +++++++++++++++++++++++++++++++----
> >>>> tools/root-cell-config.c.tmpl | 6 +-- 2 files changed, 72
> >>>> insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/pyjailhouse/sysfs_parser.py
> >>>> b/pyjailhouse/sysfs_parser.py index 4bb50605..368714b0 100644
> >>>> --- a/pyjailhouse/sysfs_parser.py
> >>>> +++ b/pyjailhouse/sysfs_parser.py
> >>>> @@ -22,6 +22,8 @@ import struct
> >>>>  import os
> >>>>  import fnmatch
> >>>>  
> >>>> +from enum import Enum
> >>>> +
> >>>>  root_dir = "/"
> >>>>  
> >>>>  def set_root_dir(dir):
> >>>> @@ -542,6 +544,65 @@ class PCIBARs:
> >>>>          f.close()
> >>>>  
> >>>>  
> >>>> +class PCI_CAP_ID(Enum):
> >>>> +    PM     = 0x01 # Power Management
> >>>> +    VPD    = 0x03 # Vital Product Data
> >>>> +    MSI    = 0x05 # Message Signalled Interrupts
> >>>> +    HT     = 0x08 # HyperTransport
> >>>> +    VNDR   = 0x09 # Vendor-Specific
> >>>> +    DBG    = 0x0A # Debug port
> >>>> +    SSVID  = 0x0D # Bridge subsystem vendor/device ID
> >>>> +    SECDEV = 0x0F # Secure Device
> >>>> +    EXP    = 0x10 # PCI Express
> >>>> +    MSIX   = 0x11 # MSI-X
> >>>> +    SATA   = 0x12 # SATA Data/Index Conf.
> >>>> +    AF     = 0x13 # PCI Advanced Features
> >>>> +
> >>>> +    def __str__(self):
> >>>> +        return "PCI_CAP_ID_" + self.name
> >>>> +
> >>>> +
> >>>> +class PCI_EXT_CAP_ID(Enum):
> >>>> +    ZERO    = 0x00 # ???
> >>>> +
> >>>> +    ERR     = 0x01 # Advanced Error Reporting
> >>>> +    VC      = 0x02 # Virtual Channel Capability
> >>>> +    DSN     = 0x03 # Device Serial Number
> >>>> +    PWR     = 0x04 # Power Budgeting
> >>>> +    RCLD    = 0x05 # Root Complex Link Declaration
> >>>> +    RCILC   = 0x06 # Root Complex Internal Link Control
> >>>> +    RCEC    = 0x07 # Root Complex Event Collector
> >>>> +    MFVC    = 0x08 # Multi-Function VC Capability
> >>>> +    VC9     = 0x09 # same as _VC
> >>>> +    RCRB    = 0x0A # Root Complex RB?
> >>>> +    VNDR    = 0x0B # Vendor-Specific
> >>>> +    CAC     = 0x0C # Config Access - obsolete
> >>>> +    ACS     = 0x0D # Access Control Services
> >>>> +    ARI     = 0x0E # Alternate Routing ID
> >>>> +    ATS     = 0x0F # Address Translation Services
> >>>> +    SRIOV   = 0x10 # Single Root I/O Virtualization
> >>>> +    MRIOV   = 0x11 # Multi Root I/O Virtualization
> >>>> +    MCAST   = 0x12 # Multicast
> >>>> +    PRI     = 0x13 # Page Request Interface
> >>>> +    AMD_XXX = 0x14 # Reserved for AMD
> >>>> +    REBAR   = 0x15 # Resizable BAR
> >>>> +    DPA     = 0x16 # Dynamic Power Allocation
> >>>> +    TPH     = 0x17 # TPH Requester
> >>>> +    LTR     = 0x18 # Latency Tolerance Reporting
> >>>> +    SECPCI  = 0x19 # Secondary PCIe Capability
> >>>> +    PMUX    = 0x1A # Protocol Multiplexing
> >>>> +    PASID   = 0x1B # Process Address Space ID
> >>>> +    DPC     = 0x1D # Downstream Port Containment
> >>>> +    L1SS    = 0x1E # L1 PM Substates
> >>>> +    PTM     = 0x1F # Precision Time Measurement
> >>>> +
> >>>> +    def __str__(self):
> >>>> +        id = "0x00"
> >>>> +        if self.value != 0:
> >>>> +            id = "PCI_EXT_CAP_ID_" + self.name
> >>>> +        return id + " | JAILHOUSE_PCI_EXT_CAP"
> >>>> +
> >>>> +
> >>>>  class PCICapability:
> >>>>      def __init__(self, id, start, len, flags, content,
> >>>> msix_address): self.id = id
> >>>> @@ -580,11 +641,12 @@ class PCICapability:
> >>>>              msix_address = 0
> >>>>              f.seek(cap)
> >>>>              (id, next) = struct.unpack('<BB', f.read(2))
> >>>> -            if id == 0x01:  # Power Management
> >>>> +            id = PCI_CAP_ID(id)
> >>>> +            if id == PCI_CAP_ID.PM:
> >>>>                  # this cap can be handed out completely
> >>>>                  len = 8
> >>>>                  flags = PCICapability.RW
> >>>> -            elif id == 0x05:  # MSI
> >>>> +            elif id == PCI_CAP_ID.MSI:
> >>>>                  # access will be moderated by hypervisor
> >>>>                  len = 10
> >>>>                  (msgctl,) = struct.unpack('<H', f.read(2))
> >>>> @@ -593,7 +655,7 @@ class PCICapability:
> >>>>                  if (msgctl & (1 << 8)) != 0:  # per-vector
> >>>> masking support len += 10
> >>>>                  flags = PCICapability.RW
> >>>> -            elif id == 0x10:  # Express
> >>>> +            elif id == PCI_CAP_ID.EXP:
> >>>>                  len = 20
> >>>>                  (cap_reg,) = struct.unpack('<H', f.read(2))
> >>>>                  if (cap_reg & 0xf) >= 2:  # v2 capability
> >>>> @@ -601,7 +663,7 @@ class PCICapability:
> >>>>                  # access side effects still need to be analyzed
> >>>>                  flags = PCICapability.RD
> >>>>                  has_extended_caps = True
> >>>> -            elif id == 0x11:  # MSI-X
> >>>> +            elif id == PCI_CAP_ID.MSIX:
> >>>>                  # access will be moderated by hypervisor
> >>>>                  len = 12
> >>>>                  (table,) = struct.unpack('<xxI', f.read(6))
> >>>> @@ -637,8 +699,9 @@ class PCICapability:
> >>>>                            'Extended Capability ID %x' % id)
> >>>>                      continue
> >>>>  
> >>>> +                id = PCI_EXT_CAP_ID(id)
> >>>>                  next = version_next >> 4
> >>>> -                if id == 0x0010:  # SR-IOV
> >>>> +                if id == PCI_EXT_CAP_ID.SRIOV:
> >>>>                      len = 64
> >>>>                      # access side effects still need to be
> >>>> analyzed flags = PCICapability.RD
> >>>> @@ -648,7 +711,6 @@ class PCICapability:
> >>>>                      flags = PCICapability.RD
> >>>>                  f.seek(cap + 4)
> >>>>                  content = f.read(len - 4)
> >>>> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
> >>>>                  caps.append(PCICapability(id, cap, len, flags,
> >>>> content, 0)) 
> >>>>          f.close()
> >>>> @@ -674,9 +736,10 @@ class PCIDevice:
> >>>>          self.msix_region_size = 0
> >>>>          self.msix_address = 0
> >>>>          for c in caps:
> >>>> -            if c.id in (0x05, 0x11):
> >>>> +            if isinstance(c.id, PCI_CAP_ID) and \
> >>>> +               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
> >>>>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
> >>>> -                if c.id == 0x05:  # MSI
> >>>> +                if c.id == PCI_CAP_ID.MSI:
> >>>>                      self.num_msi_vectors = 1 << ((msg_ctrl >>
> >>>> 1) & 0x7) self.msi_64bits = (msg_ctrl >> 7) & 1
> >>>>                  else:  # MSI-X
> >>>> diff --git a/tools/root-cell-config.c.tmpl
> >>>> b/tools/root-cell-config.c.tmpl index b80d7889..b4d64adf 100644
> >>>> --- a/tools/root-cell-config.c.tmpl
> >>>> +++ b/tools/root-cell-config.c.tmpl
> >>>> @@ -196,11 +196,7 @@ struct {
> >>>>  		/* ${comment} */
> >>>>  		% endfor
> >>>>  		{
> >>>> -			% if (c.id & 0x8000) != 0:
> >>>> -			.id = ${hex(c.id & 0x7fff)} |
> >>>> JAILHOUSE_PCI_EXT_CAP,
> >>>> -			% else:
> >>>> -			.id = ${hex(c.id)},
> >>>> -			% endif
> >>>> +			.id = ${c.id},
> >>>>  			.start = ${hex(c.start)},
> >>>>  			.len = ${c.len},
> >>>>  			.flags = ${c.flags},    
> >>>     
> >   

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
