Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBVHWVPTAKGQEN5ASPDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA211B09
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 16:14:44 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id r20sf1122180edp.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 07:14:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556806484; cv=pass;
        d=google.com; s=arc-20160816;
        b=HGbe+kp4SyTiDKdJFpQaGQ0vZeExqiHTGxoe93Q+8TD0BsekgvW3f4n3pY+uliQBeR
         9+KDIoRjJKwrwJQd2PnC5aCTM+SmDuwt75Fe1X6wBNRlOa6G5gUlGxQzNC3QpLtyp8aX
         Ho/jTGnnnWCiepKwjxl/pWhMCP4EYcD2LXYUTNf4g2nSrK5i+i91zX+U7Bl/PgcnDiOW
         yDe5UeWMuMvo0p8Dou6EvBNlbiaXVI24jmts3sVwX54sRJ3mO43ytxap79+ZZb5+2mku
         DBFma1Rrg6u8LtxVbnjCnD8mZUrU6DCVWa76Yz1TsHuTAjUy+gh94j3Zx29wVIWKI6qe
         QH7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=vLdBbIouThlYN6jKAsObblS/H25JeEWmzMX8gtW6vv8=;
        b=uIWrNUlwqUHwK0uvu3q2fRSucjCcP227fht/j7GgttHTsAujOTQfL7hseRp9fZMhSy
         EmjcKhqR3aSixCxUgYMTcEeiV8j8rn6ucWyJPi3agBd1P2wpK6kqQyP6Q41TDBCP/j9l
         58ScIKq3jHS4oDVaDnhny2J7BDqLIZDDEmUlgIScAXrWB3309vPD9qF5Fr0Z3R9j0NKG
         +BRO/D6+wsJYX3jt1hLbItfW63RBNJJXqAeqqARUcph/JQsHyguVKors6/gm7k7oyWPO
         ydQ15/c5mlfxhynqyhOTtYN4Zvudwtrt28JoookDdSO4vPeAnRqJy47xcHLKKZthS5Tf
         0k7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLdBbIouThlYN6jKAsObblS/H25JeEWmzMX8gtW6vv8=;
        b=FruoWNu4P5CBEQs9j1ufGUprwx9HTItOZC2Qn64Ksz4FICpGyL/7kr5eN1aek3Fvmh
         HbM7znqBTKLCqVS6/4Adeu7Ru2J2JPHFOshq1Ub/bCR2u2sL0/ME+lrDwWvxLYO3HaO0
         tm+kQWxAutgbd81/oYAbhKTT75XAQ+xFf2JmmZxXZcOM+NSdk8Xe2yA+SROXyafkmHu/
         rMTvBTbAqxf4x5zN8WxYQItLSDxiMEsEwi3rqyYtWTNxQI2UYriXs+RMy6pI+lyCX4SG
         QJ57hfL8Yj+cz1KHrljzTgHbPnRm86sqUY/UMZuVqJBJw03TW50gWsOoZ+VQUbyumtps
         qhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLdBbIouThlYN6jKAsObblS/H25JeEWmzMX8gtW6vv8=;
        b=r1djMqlsevuawD56gIzP6Kkf6DFZveAtOkKxrRQ2SuhLNp3tZgoIWrLhnSz176Q80o
         a9M/BOgmHKGqBjE6pmxQa2Zc0yBIDiwdAg6eINpbNCPx5Vhpyz8XG0pkkWjBCSnnJhlj
         8aU/BA0CSif53dQk06Zu65cH/obUtVxCqvrHpUwM6t41v9WZhzOJ2CdZ1H0fSSRlHXvw
         Xi0J7IUuvYGq0LIdiJis/tdVIkmj6svE5T18h8K6igymArmcTy9gCfcielhTzE8NZWh6
         qsZN39VO33vxnK4cbYt5LqqfoVAPUqZFRYFeEwbsTr204JXDyb3UWrcK8XB4+AEqJs55
         ZUcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXiqpVwXGMHbQKYGuhkIVlvOeihbRJjfJsbUf1zhbySSXok0Jua
	ak4W4a3JZ1ETDD21r59yAqs=
X-Google-Smtp-Source: APXvYqwp7QsRDXYkradPStAXNtHYMLPpfGI6/pvWWrvb2f3FSBUameodDQZKTl4NU14tOA/zAAS3AA==
X-Received: by 2002:aa7:c402:: with SMTP id j2mr2749863edq.165.1556806484202;
        Thu, 02 May 2019 07:14:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7ad7:: with SMTP id k23ls332326ejo.6.gmail; Thu, 02
 May 2019 07:14:43 -0700 (PDT)
X-Received: by 2002:a17:906:12c1:: with SMTP id l1mr1968075ejb.284.1556806483637;
        Thu, 02 May 2019 07:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556806483; cv=none;
        d=google.com; s=arc-20160816;
        b=felObSgiPCJmopWq4lQlVm2oveiOY/MZ3rM8NOcB7gZYPMIMUQt/2BtWpsAS2tuCMp
         X9ysc0iKoMMtpT9cr1dByvfXIz5BjhONtSjiTIQgzlbs8VrpkRrZFZHLWi6y+98kfXOw
         GUHf0W/AaPmgtIHghdFHSzc2Hp4yuKvr5DFiSgY/bVY7C7n+Z/PktGZViEeeMe7lkK3J
         JEDrZ+A6r0dj40/E4E4rCxhUaLlXuvF4xdtjqsWrkoRSx2YvWVsde3Ea9uK4Gq873Hg4
         T/uYuM9KBnlLXLcDq1VAj9eiomAlm7Q7JPl7D0If2Qh5nkwQVqRvULSB3UmYgkCJIEWB
         YXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Ig7YFELixuIbkjIp845NW2hutHzvl6F2OVVfuXcg2Sk=;
        b=q3zBCHrjMo3SOW03ND2K7C/EGNXfpKg0mXyl8iFjjWJ0cIXssFlbhZmRCDO4U80G8W
         AKbQIlYqZ1k+nILH9eaiu6TmgYOP5INMLla2+4lfSHqvcrxOuSXd5VR58HOlgQ3GWr7A
         Rw7ICaqVt1OzMva74tTSf0+49newyUmQLg/HauFaGnlBrLCLR8qkIQ3x1oFhodzmJ56k
         HYPwBX3aZDpUSZCZVDW7eD6Mmoy0DHVYl1cTXMnJJIXYOYMHH5kODFW8SI8fybmFXuv6
         4BUFfeUUw4Bs58oo6Gx6h5hALmyArIgTF+rkfdoCyjHJW7lJBPuSQEFFNSkknsjH/ZZm
         B+Nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id os21si123468ejb.0.2019.05.02.07.14.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x42EEhZl031941
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2019 16:14:43 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x42EEgtK010943;
	Thu, 2 May 2019 16:14:42 +0200
Date: Thu, 2 May 2019 16:14:42 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking
 names for PCI caps
Message-ID: <20190502161442.3e2db927@md1za8fc.ad001.siemens.net>
In-Reply-To: <ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
	<20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
	<20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
	<ba561eef-b30f-c440-e301-55c073d49e46@oth-regensburg.de>
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

Am Thu, 2 May 2019 12:19:10 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Hi,
> 
> On 5/2/19 10:31 AM, Henning Schild wrote:
> > Hi Ralf,
> > 
> > redefining the "Enum" seems not too elegant. Did you look into ways
> > to use the header from python?  
> 
> Duplicating things is in deed not the most elegant way, but it's the
> way how we handle other magic constants as well.
> 
> Didn't yet look at any alternatives.
> 
> > 
> > The "defines" should be really easy to parse without even using a
> > special python library. The only real problem might be locating the
> > header, it would need to be installed when running "installed" or
> > relative when running "local".  
> 
> We could create a pyjailhouse/pcicaps.py during compilation phase.
> Make/sed magic could create the python file from a stub. This is
> basically the same how we create generated C headers.
> 
> This would a) autocreate the "Enum" and make it easy to maintain and
> b) solve the problem when being installed.
> 
> What do you think about this?

Not sure the extra make before the first use would be nice or
acceptable. The python code could be generated inside pip, in which
case you want to have a solution for non-pip users.
Maybe generate the python code from the header with pip, if the python
code is not there fall back to using magic numbers.

Or we stick with the copy and wait for the first inconsistency to make
us follow up ;).

Henning

>   Ralf
> 
> > 
> > Henning
> > 
> > Am Tue, 30 Apr 2019 23:45:04 +0200
> > schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> >   
> >> Definitions on C-side are in place, so let the generator produce
> >> those definitions.
> >>
> >> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> >> ---
> >>  pyjailhouse/sysfs_parser.py   | 79
> >> +++++++++++++++++++++++++++++++---- tools/root-cell-config.c.tmpl |
> >> 6 +-- 2 files changed, 72 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/pyjailhouse/sysfs_parser.py
> >> b/pyjailhouse/sysfs_parser.py index 4bb50605..368714b0 100644
> >> --- a/pyjailhouse/sysfs_parser.py
> >> +++ b/pyjailhouse/sysfs_parser.py
> >> @@ -22,6 +22,8 @@ import struct
> >>  import os
> >>  import fnmatch
> >>  
> >> +from enum import Enum
> >> +
> >>  root_dir = "/"
> >>  
> >>  def set_root_dir(dir):
> >> @@ -542,6 +544,65 @@ class PCIBARs:
> >>          f.close()
> >>  
> >>  
> >> +class PCI_CAP_ID(Enum):
> >> +    PM     = 0x01 # Power Management
> >> +    VPD    = 0x03 # Vital Product Data
> >> +    MSI    = 0x05 # Message Signalled Interrupts
> >> +    HT     = 0x08 # HyperTransport
> >> +    VNDR   = 0x09 # Vendor-Specific
> >> +    DBG    = 0x0A # Debug port
> >> +    SSVID  = 0x0D # Bridge subsystem vendor/device ID
> >> +    SECDEV = 0x0F # Secure Device
> >> +    EXP    = 0x10 # PCI Express
> >> +    MSIX   = 0x11 # MSI-X
> >> +    SATA   = 0x12 # SATA Data/Index Conf.
> >> +    AF     = 0x13 # PCI Advanced Features
> >> +
> >> +    def __str__(self):
> >> +        return "PCI_CAP_ID_" + self.name
> >> +
> >> +
> >> +class PCI_EXT_CAP_ID(Enum):
> >> +    ZERO    = 0x00 # ???
> >> +
> >> +    ERR     = 0x01 # Advanced Error Reporting
> >> +    VC      = 0x02 # Virtual Channel Capability
> >> +    DSN     = 0x03 # Device Serial Number
> >> +    PWR     = 0x04 # Power Budgeting
> >> +    RCLD    = 0x05 # Root Complex Link Declaration
> >> +    RCILC   = 0x06 # Root Complex Internal Link Control
> >> +    RCEC    = 0x07 # Root Complex Event Collector
> >> +    MFVC    = 0x08 # Multi-Function VC Capability
> >> +    VC9     = 0x09 # same as _VC
> >> +    RCRB    = 0x0A # Root Complex RB?
> >> +    VNDR    = 0x0B # Vendor-Specific
> >> +    CAC     = 0x0C # Config Access - obsolete
> >> +    ACS     = 0x0D # Access Control Services
> >> +    ARI     = 0x0E # Alternate Routing ID
> >> +    ATS     = 0x0F # Address Translation Services
> >> +    SRIOV   = 0x10 # Single Root I/O Virtualization
> >> +    MRIOV   = 0x11 # Multi Root I/O Virtualization
> >> +    MCAST   = 0x12 # Multicast
> >> +    PRI     = 0x13 # Page Request Interface
> >> +    AMD_XXX = 0x14 # Reserved for AMD
> >> +    REBAR   = 0x15 # Resizable BAR
> >> +    DPA     = 0x16 # Dynamic Power Allocation
> >> +    TPH     = 0x17 # TPH Requester
> >> +    LTR     = 0x18 # Latency Tolerance Reporting
> >> +    SECPCI  = 0x19 # Secondary PCIe Capability
> >> +    PMUX    = 0x1A # Protocol Multiplexing
> >> +    PASID   = 0x1B # Process Address Space ID
> >> +    DPC     = 0x1D # Downstream Port Containment
> >> +    L1SS    = 0x1E # L1 PM Substates
> >> +    PTM     = 0x1F # Precision Time Measurement
> >> +
> >> +    def __str__(self):
> >> +        id = "0x00"
> >> +        if self.value != 0:
> >> +            id = "PCI_EXT_CAP_ID_" + self.name
> >> +        return id + " | JAILHOUSE_PCI_EXT_CAP"
> >> +
> >> +
> >>  class PCICapability:
> >>      def __init__(self, id, start, len, flags, content,
> >> msix_address): self.id = id
> >> @@ -580,11 +641,12 @@ class PCICapability:
> >>              msix_address = 0
> >>              f.seek(cap)
> >>              (id, next) = struct.unpack('<BB', f.read(2))
> >> -            if id == 0x01:  # Power Management
> >> +            id = PCI_CAP_ID(id)
> >> +            if id == PCI_CAP_ID.PM:
> >>                  # this cap can be handed out completely
> >>                  len = 8
> >>                  flags = PCICapability.RW
> >> -            elif id == 0x05:  # MSI
> >> +            elif id == PCI_CAP_ID.MSI:
> >>                  # access will be moderated by hypervisor
> >>                  len = 10
> >>                  (msgctl,) = struct.unpack('<H', f.read(2))
> >> @@ -593,7 +655,7 @@ class PCICapability:
> >>                  if (msgctl & (1 << 8)) != 0:  # per-vector masking
> >> support len += 10
> >>                  flags = PCICapability.RW
> >> -            elif id == 0x10:  # Express
> >> +            elif id == PCI_CAP_ID.EXP:
> >>                  len = 20
> >>                  (cap_reg,) = struct.unpack('<H', f.read(2))
> >>                  if (cap_reg & 0xf) >= 2:  # v2 capability
> >> @@ -601,7 +663,7 @@ class PCICapability:
> >>                  # access side effects still need to be analyzed
> >>                  flags = PCICapability.RD
> >>                  has_extended_caps = True
> >> -            elif id == 0x11:  # MSI-X
> >> +            elif id == PCI_CAP_ID.MSIX:
> >>                  # access will be moderated by hypervisor
> >>                  len = 12
> >>                  (table,) = struct.unpack('<xxI', f.read(6))
> >> @@ -637,8 +699,9 @@ class PCICapability:
> >>                            'Extended Capability ID %x' % id)
> >>                      continue
> >>  
> >> +                id = PCI_EXT_CAP_ID(id)
> >>                  next = version_next >> 4
> >> -                if id == 0x0010:  # SR-IOV
> >> +                if id == PCI_EXT_CAP_ID.SRIOV:
> >>                      len = 64
> >>                      # access side effects still need to be
> >> analyzed flags = PCICapability.RD
> >> @@ -648,7 +711,6 @@ class PCICapability:
> >>                      flags = PCICapability.RD
> >>                  f.seek(cap + 4)
> >>                  content = f.read(len - 4)
> >> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
> >>                  caps.append(PCICapability(id, cap, len, flags,
> >> content, 0)) 
> >>          f.close()
> >> @@ -674,9 +736,10 @@ class PCIDevice:
> >>          self.msix_region_size = 0
> >>          self.msix_address = 0
> >>          for c in caps:
> >> -            if c.id in (0x05, 0x11):
> >> +            if isinstance(c.id, PCI_CAP_ID) and \
> >> +               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
> >>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
> >> -                if c.id == 0x05:  # MSI
> >> +                if c.id == PCI_CAP_ID.MSI:
> >>                      self.num_msi_vectors = 1 << ((msg_ctrl >> 1) &
> >> 0x7) self.msi_64bits = (msg_ctrl >> 7) & 1
> >>                  else:  # MSI-X
> >> diff --git a/tools/root-cell-config.c.tmpl
> >> b/tools/root-cell-config.c.tmpl index b80d7889..b4d64adf 100644
> >> --- a/tools/root-cell-config.c.tmpl
> >> +++ b/tools/root-cell-config.c.tmpl
> >> @@ -196,11 +196,7 @@ struct {
> >>  		/* ${comment} */
> >>  		% endfor
> >>  		{
> >> -			% if (c.id & 0x8000) != 0:
> >> -			.id = ${hex(c.id & 0x7fff)} |
> >> JAILHOUSE_PCI_EXT_CAP,
> >> -			% else:
> >> -			.id = ${hex(c.id)},
> >> -			% endif
> >> +			.id = ${c.id},
> >>  			.start = ${hex(c.start)},
> >>  			.len = ${c.len},
> >>  			.flags = ${c.flags},  
> >   

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
