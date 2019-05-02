Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBZGVVLTAKGQE5CWA3ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE511570
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 10:31:33 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id z21sf1144865wmf.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 01:31:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556785893; cv=pass;
        d=google.com; s=arc-20160816;
        b=ns40sajWJ2Nwjkgp8hWQHA4u0oxxrhpeljwEzGTRdCmLe4L7OfaD9aYkO57Dv5p6Ca
         aEiAAsFh0Df4jnwaoLJ3FL1aWQFoOpbL4L54NIuvasVypzIbUOG746SR8UyKKAoOq/9s
         /weuW1lRmrpJHYRpTxlPwXD0N9JMbPA1YSieWiKcA0f8QDOiQMNF3dEEmftgPdU9KhMU
         p8U5I1kLnGBGzzzrMcUNotE4Lgzp5yDNoII2BdZOE45y26WGpdNV7n/DvjC5cz2NUK5g
         HNjpXfAGLrMKDisII9oXN2kjjZCbZeXGFm9DqYkXTLkwsfgbrvaYCaTM1oFGOrRuAC6Y
         yEbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=7qMkzKekIO/XP04IrevVWhxG/zshqrVPhzG1bclYfUg=;
        b=ohkDTFYC67/fFiTK8ePgV6wWC15t1Sx1rGT7OXmRJZBzqDacqOIIk8EsToQlhaIA1L
         sMYREDuOIVHumnKK/chyFdfxx6O4h0kK7NUmAzyzBjqBBWxPAGXBWL8zP7ENJ8/IeAPl
         vIqVOijh/Vbr4KW02luqzcSXzCh53zFsz2F8erkCKyyL4kOxtOAjWfNzkJNGbZatWKVn
         EMpUiYhYsErIvyNI0Jywja92OGNT6X0RDM2ID+CxEqt6LPB/Bh+g6XjVtljRZqV0xDv3
         cw4FGwsmzbtpzhy9tnnpajpdOCwH3JaFmkwRcBG841OqRwzpZ0b5U4NI20oQCdCUxhDM
         Y/0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7qMkzKekIO/XP04IrevVWhxG/zshqrVPhzG1bclYfUg=;
        b=fuaGuz127N+KNOpsxac3EoS0gSdtL1bMcbJzMKzxKSzKwpMmF9phOhJ2wqqrHla0zn
         Cx+quVSA4NFWWSJL6rsLWe+2buox6N+ukvWbZ0gehkaNd9ufU5Tj0hAaNqC5TvYsoCGW
         Ds6t4HV4s8pdxsafMaqRuH1dBoo5kmbGUzdxkHMBxvTB7C2jvY/yCzyTSvX7Q8XcvYni
         W8xqEd/EwxEq2sDJLvpD6W9YuRe4K0YwKAlRtdqg7nzU380Cah7kw9rvLBXcnDsH3riE
         P+UZnNod0gUa388tmo84MnwrKxZzs+OutKD3r5MxEup6Ut9yut8cHaRgPMle2NMv0lU3
         G2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7qMkzKekIO/XP04IrevVWhxG/zshqrVPhzG1bclYfUg=;
        b=RyG6otTd6DCf46UFGSyP/zDaeXtoADVyW+ZpJ23U3dKUtXHBD6+WaifVHEsIUoXhRK
         awffrBAC9gAK8JedhdBNCIDh3qKWTl0N22XeyCXi2uJo7ulI+YnEtAYOntqw/AfPtQWS
         N/E1IWzB6nbUJChX2b+drTE0py7LqwIgEt2dpx/fB5lErJrtPrdM+VQadMdKkIVMage8
         rWSbZxFH8hNqQkIfaPgia43JX5vwu9bLPrSzIwVMkb0HFI/tGzrGbpjn9P34kRG9d6kn
         eSfyDeLHbAvpGT/ucwUoURMz098C1eVQcpOHh8M4s/iSYJ/mkO2gI5hntAx2hnlvw+m1
         S0jw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFRVvhY0lb+5nZBBRW+gWhYob/oC6ie8FV/kNfVZDMuMa9OhJp
	fnPDiDPfw/NXSu+YcTxiXIc=
X-Google-Smtp-Source: APXvYqwtTDnJLT4AGdYhk8L1jXSNJ0fLrkhT0czEmgpB0p03wI1xPoYv6bW7K8+lqrLTZUJoEgQssA==
X-Received: by 2002:a1c:964a:: with SMTP id y71mr1473098wmd.101.1556785893173;
        Thu, 02 May 2019 01:31:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f310:: with SMTP id q16ls429347wmq.3.gmail; Thu, 02 May
 2019 01:31:32 -0700 (PDT)
X-Received: by 2002:a1c:41d7:: with SMTP id o206mr1400629wma.130.1556785892544;
        Thu, 02 May 2019 01:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556785892; cv=none;
        d=google.com; s=arc-20160816;
        b=lgUoCLfx5uZQLEG5YB21p8YjsyvbS7jgh9Ja20rmeRt4iwJ16QYmJBwpucOjf6Oc/I
         /izp0n6nWqDoYPKe0f+cZgrdoP6BhtqkedTEEBQwPD/6IahsdkoWfFWgSAh/0LLSgr52
         CW+BhqTra4UHLY6g9ysKgNBrjw+sgTxJ4Db7OjbFFCmNTojzI1yg5VO1B7ERY3GjM+QW
         KNqLa97yXgjI1tqdisvah8IK/ARGMiXH+PrNhgxt4Sixp8uCYA/n2gsKzeMQNZ04DPqL
         bz9LWVqL0/fukBezKupGE/r0dWxBUbEOL+QPxsk2RJf5FdNrRY9GQWyDwEmUNRn5pESp
         a4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=edL1IVjz2Gkz5tgGEePSkTyMcb1WrorgxSpq+faQfnY=;
        b=JNg0KN2voKT6LcLhaeYjiRT2cMpiii+ddx4jDUZwtJsNIQKAg40AlqCA5cP3v8C6de
         UrVb4p0khfBEcuIr405puxeu29//GfsyuCAeXxkoLtoeoD19D6Ggp7j/9WPCHN7SRTeq
         kvnAqiyrSwB5DUroD6wYqSM0nPr8eHajoUifhtwemeP1bM2FLKd8koNR4A7919vFc4Wj
         4JxEpKul5lVujGuQIYoOrvrPy1pXAP8MFTg3RlSy6KaxBdkn/l3XKTXxQcfYaZxZJ1GX
         1OXHEhcfMz9s1tEbUMoI/o7m4Wr2T4zc6HR4OEJz20u45RQ2cRAGZ/+tYoEFbFxk5N72
         xtSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f1si355009wme.1.2019.05.02.01.31.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 01:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x428VWXe022496
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2019 10:31:32 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x428VWbm027362;
	Thu, 2 May 2019 10:31:32 +0200
Date: Thu, 2 May 2019 10:31:31 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 5/5] pyjailhouse: let the generator produce speaking
 names for PCI caps
Message-ID: <20190502103131.4dd5d0b0@md1za8fc.ad001.siemens.net>
In-Reply-To: <20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
	<20190430214504.2153-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
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

Hi Ralf,

redefining the "Enum" seems not too elegant. Did you look into ways to
use the header from python?

The "defines" should be really easy to parse without even using a
special python library. The only real problem might be locating the
header, it would need to be installed when running "installed" or
relative when running "local".

Henning

Am Tue, 30 Apr 2019 23:45:04 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Definitions on C-side are in place, so let the generator produce those
> definitions.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 79
> +++++++++++++++++++++++++++++++---- tools/root-cell-config.c.tmpl |
> 6 +-- 2 files changed, 72 insertions(+), 13 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 4bb50605..368714b0 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -22,6 +22,8 @@ import struct
>  import os
>  import fnmatch
>  
> +from enum import Enum
> +
>  root_dir = "/"
>  
>  def set_root_dir(dir):
> @@ -542,6 +544,65 @@ class PCIBARs:
>          f.close()
>  
>  
> +class PCI_CAP_ID(Enum):
> +    PM     = 0x01 # Power Management
> +    VPD    = 0x03 # Vital Product Data
> +    MSI    = 0x05 # Message Signalled Interrupts
> +    HT     = 0x08 # HyperTransport
> +    VNDR   = 0x09 # Vendor-Specific
> +    DBG    = 0x0A # Debug port
> +    SSVID  = 0x0D # Bridge subsystem vendor/device ID
> +    SECDEV = 0x0F # Secure Device
> +    EXP    = 0x10 # PCI Express
> +    MSIX   = 0x11 # MSI-X
> +    SATA   = 0x12 # SATA Data/Index Conf.
> +    AF     = 0x13 # PCI Advanced Features
> +
> +    def __str__(self):
> +        return "PCI_CAP_ID_" + self.name
> +
> +
> +class PCI_EXT_CAP_ID(Enum):
> +    ZERO    = 0x00 # ???
> +
> +    ERR     = 0x01 # Advanced Error Reporting
> +    VC      = 0x02 # Virtual Channel Capability
> +    DSN     = 0x03 # Device Serial Number
> +    PWR     = 0x04 # Power Budgeting
> +    RCLD    = 0x05 # Root Complex Link Declaration
> +    RCILC   = 0x06 # Root Complex Internal Link Control
> +    RCEC    = 0x07 # Root Complex Event Collector
> +    MFVC    = 0x08 # Multi-Function VC Capability
> +    VC9     = 0x09 # same as _VC
> +    RCRB    = 0x0A # Root Complex RB?
> +    VNDR    = 0x0B # Vendor-Specific
> +    CAC     = 0x0C # Config Access - obsolete
> +    ACS     = 0x0D # Access Control Services
> +    ARI     = 0x0E # Alternate Routing ID
> +    ATS     = 0x0F # Address Translation Services
> +    SRIOV   = 0x10 # Single Root I/O Virtualization
> +    MRIOV   = 0x11 # Multi Root I/O Virtualization
> +    MCAST   = 0x12 # Multicast
> +    PRI     = 0x13 # Page Request Interface
> +    AMD_XXX = 0x14 # Reserved for AMD
> +    REBAR   = 0x15 # Resizable BAR
> +    DPA     = 0x16 # Dynamic Power Allocation
> +    TPH     = 0x17 # TPH Requester
> +    LTR     = 0x18 # Latency Tolerance Reporting
> +    SECPCI  = 0x19 # Secondary PCIe Capability
> +    PMUX    = 0x1A # Protocol Multiplexing
> +    PASID   = 0x1B # Process Address Space ID
> +    DPC     = 0x1D # Downstream Port Containment
> +    L1SS    = 0x1E # L1 PM Substates
> +    PTM     = 0x1F # Precision Time Measurement
> +
> +    def __str__(self):
> +        id = "0x00"
> +        if self.value != 0:
> +            id = "PCI_EXT_CAP_ID_" + self.name
> +        return id + " | JAILHOUSE_PCI_EXT_CAP"
> +
> +
>  class PCICapability:
>      def __init__(self, id, start, len, flags, content, msix_address):
>          self.id = id
> @@ -580,11 +641,12 @@ class PCICapability:
>              msix_address = 0
>              f.seek(cap)
>              (id, next) = struct.unpack('<BB', f.read(2))
> -            if id == 0x01:  # Power Management
> +            id = PCI_CAP_ID(id)
> +            if id == PCI_CAP_ID.PM:
>                  # this cap can be handed out completely
>                  len = 8
>                  flags = PCICapability.RW
> -            elif id == 0x05:  # MSI
> +            elif id == PCI_CAP_ID.MSI:
>                  # access will be moderated by hypervisor
>                  len = 10
>                  (msgctl,) = struct.unpack('<H', f.read(2))
> @@ -593,7 +655,7 @@ class PCICapability:
>                  if (msgctl & (1 << 8)) != 0:  # per-vector masking
> support len += 10
>                  flags = PCICapability.RW
> -            elif id == 0x10:  # Express
> +            elif id == PCI_CAP_ID.EXP:
>                  len = 20
>                  (cap_reg,) = struct.unpack('<H', f.read(2))
>                  if (cap_reg & 0xf) >= 2:  # v2 capability
> @@ -601,7 +663,7 @@ class PCICapability:
>                  # access side effects still need to be analyzed
>                  flags = PCICapability.RD
>                  has_extended_caps = True
> -            elif id == 0x11:  # MSI-X
> +            elif id == PCI_CAP_ID.MSIX:
>                  # access will be moderated by hypervisor
>                  len = 12
>                  (table,) = struct.unpack('<xxI', f.read(6))
> @@ -637,8 +699,9 @@ class PCICapability:
>                            'Extended Capability ID %x' % id)
>                      continue
>  
> +                id = PCI_EXT_CAP_ID(id)
>                  next = version_next >> 4
> -                if id == 0x0010:  # SR-IOV
> +                if id == PCI_EXT_CAP_ID.SRIOV:
>                      len = 64
>                      # access side effects still need to be analyzed
>                      flags = PCICapability.RD
> @@ -648,7 +711,6 @@ class PCICapability:
>                      flags = PCICapability.RD
>                  f.seek(cap + 4)
>                  content = f.read(len - 4)
> -                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
>                  caps.append(PCICapability(id, cap, len, flags,
> content, 0)) 
>          f.close()
> @@ -674,9 +736,10 @@ class PCIDevice:
>          self.msix_region_size = 0
>          self.msix_address = 0
>          for c in caps:
> -            if c.id in (0x05, 0x11):
> +            if isinstance(c.id, PCI_CAP_ID) and \
> +               c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
>                  msg_ctrl = struct.unpack('<H', c.content[:2])[0]
> -                if c.id == 0x05:  # MSI
> +                if c.id == PCI_CAP_ID.MSI:
>                      self.num_msi_vectors = 1 << ((msg_ctrl >> 1) &
> 0x7) self.msi_64bits = (msg_ctrl >> 7) & 1
>                  else:  # MSI-X
> diff --git a/tools/root-cell-config.c.tmpl
> b/tools/root-cell-config.c.tmpl index b80d7889..b4d64adf 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -196,11 +196,7 @@ struct {
>  		/* ${comment} */
>  		% endfor
>  		{
> -			% if (c.id & 0x8000) != 0:
> -			.id = ${hex(c.id & 0x7fff)} |
> JAILHOUSE_PCI_EXT_CAP,
> -			% else:
> -			.id = ${hex(c.id)},
> -			% endif
> +			.id = ${c.id},
>  			.start = ${hex(c.start)},
>  			.len = ${c.len},
>  			.flags = ${c.flags},

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
