Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTMUY7TAKGQEUN7RUZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBE169F1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 20:11:26 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id 134sf2389495lfk.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 11:11:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557252686; cv=pass;
        d=google.com; s=arc-20160816;
        b=0cxnUYOavZyb26Dx+bPDuFCmm7Genoq8fpJiBSqtVPZdz54Xztka0qOInE110rehmY
         Tybnzb1guO19OBpJxxKO0jULQHHepfnbY73D10xAcLFdfjIxwHRzOuG9DvnlZvZbNG5m
         tmkOcr6lax924ORPtxGI+ab5IO5rYNRYn0rcNYNDuMMDSy0fp9TUOwYfgRkuM1JLYTUb
         F6Mch7OnKrNsVgY+uMZ2aL1l+A3RgvU5PX7NDgEoWBBFcBNGYeYQbJLANGI5TanpvE4Z
         PoOLS+CaG1omBzwl79BRmhNubEFIybnxJe090S3RJl7zZZmqiDrdLiE3CVrC+AfBUhbc
         Hnqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=M/Prbj+lJ3v6TKzc/r25irzS+nJk7Ypk6bQOqDlo288=;
        b=YRPLb3FuWNw6Cr2RYpr4yvxvAo8n7WxI3AmmfazAU51zWZusy1pA/9xgW13WB+6371
         eARwVGZ4LPu8eY1dTc9n0unc4JdtCdSS4YqZu3i1CtgsnwuwoBHMVBxh//ezJuZH4hyW
         uk9ciBYI8R3lvfVAxVgOufaQNop4hzt8CyLDaQLTSlsUqOI6lURXwKe88lC+DCw/GBH9
         oeXny7jb10Le/JTf1H00Zd8nlRo6A44eg55Sfm4JHW944DEq2XLNaQbMHbQP76mhWGgc
         cT2lxcxCufMpR4sP7oDo2t1Q76cfPwA0Rz3pyAi+czbQROfqeqLgaezIveRFie/oj/ma
         Xu/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M/Prbj+lJ3v6TKzc/r25irzS+nJk7Ypk6bQOqDlo288=;
        b=PB3EuU77dSG+4OgMm4Xu7vvr+f3F+Acy+PCEUjyil94qWjLtqYCkHL3AazyjCAWrIK
         8biA1F3XHwmyo6adwdAsIWJ+GxaiiJV7ZsFNFfVrUalum+yWzq9bGk2rlvtcfUSa+Et/
         q+Igan/kl0zYyfSnXIYvhTj5okeQPgxC0L08t+SIk2nTVI6xgOKpy+zEGqcKshj+gvua
         ZJRisMV/cMQ5vMvzOmrs44i+eNh+K5pn8dSuVLRxGJXkC1hTwvjXHm4wIZ0X4y5N6UoB
         fhhLBlT5CpSSXsjaQCITBxtKje3qeON/VH2viJ1Sm6hLGRv+5rkSCDwF9QiyImK70Ad+
         QiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=M/Prbj+lJ3v6TKzc/r25irzS+nJk7Ypk6bQOqDlo288=;
        b=a4zZZXQzT9AtFh5I1SMo3fZo7Q+13ZOfxT5vAaYMMUoEIQkf/+apDq+zCQ4dDk57TK
         tCoK2xli2zeYGNPCWDM04DQoxPFbnMeYMp+d9cxe8iIsaCim0hnAvAX4ggpsB4sI8UqA
         PR02GRb/vQSh2wAUHJNQo/ZKgUq08+DAYuBTTyW1kqavqSZIiDdKgQX2tIe9GcGQve2J
         qO8mDiH+qi+EvPYLEeVp+RL3dk4HYusAsADAQvQnxJMm+GoqgLDTo8LvN++W2nJdyRaB
         Nwt/bf03GJzk3rifev2ufPFMjU2J/3aNYjySL3/XYWzjSGILWG0v4xAKdC4DmVdzptNV
         mwhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3ZW40Y0zFFKlFOxdGJZmFh31COZTK0YkE+FCPw6cEBAwCBbBU
	FCDXxvyA9NM2BinPajhzFnQ=
X-Google-Smtp-Source: APXvYqwi2pQQLvyeT0Trw76JoUVRRGWZ5X4heVwsvXVSnbFEr/LbcpMjnGKNlmDscL43QtOEoHBbRQ==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr1553081lfu.26.1557252686003;
        Tue, 07 May 2019 11:11:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:1215:: with SMTP id t21ls1795597lje.6.gmail; Tue, 07 May
 2019 11:11:25 -0700 (PDT)
X-Received: by 2002:a2e:390c:: with SMTP id g12mr19477562lja.174.1557252685152;
        Tue, 07 May 2019 11:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557252685; cv=none;
        d=google.com; s=arc-20160816;
        b=JzlHrTgJXyMgyFqu/8n5omnxuzOVWkSoITGdZAQgEEZvffKAGhjhXNPa0tNxOEibDN
         SmBAVvibIHAUgBP7Lsfw8fILTx9Vd67xDOhTMJ0yvI+KWYdB1fXGA8fP3AS+Tx7+ID33
         h0qzv2v4GzJr5ZejtA3c/vqZOHpz2wX/2LDkRJfRlGdzRxGzP5m2KeQzVVDcwzul4vEw
         PdnL1aYtjo5Vxo/NL+3J2QWjI4r1/C2vwg0kcGatjQRbFBohHp40AfOmWodGJKtg3h7Q
         90X2063nPSr8O0bd7i1YWzHC9zxKh8ajE3pbh2AkFgtHBOPlui2FVxA8PCCVvGhc4j22
         vP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dbweMmQEIqMmyxhN5xCrv/HHEqABLWBC37KtPj18TOI=;
        b=kzPztOhPTCBnNsmd5R1dgpFSlwl/HvL1+cQNtjsemt2M0E9twXqEPdU4h30PSMGfdI
         zjVtKCumGVBQSv8/aWU8MkgEcAAvPC8+vgsgWCqVUIARWObDaeZYBzLwvFhKUNpldUNU
         E/ReGD0VExYsDUbuZ5ASZQSB+L2n2rE5V3T/1jcST6bPOU8kn3yA2nFFuZklfMThLw+L
         zQtMoQe5a4kZZ3L+O4u/h8Qfi+E/+dkEllsruPI86mRagpl6YUvc01fvVFtLSjqHfFls
         +JPvuW4AbMJoe7UA2ikwxwqeOxkNWqPoe5cEqUReHa9nPRrD05ah4MaJCnJxq/2f9wEg
         9PZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p12si403835ljh.5.2019.05.07.11.11.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x47IBO0O008135
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 20:11:24 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x47IBOXi015121;
	Tue, 7 May 2019 20:11:24 +0200
Subject: Re: [PATCH v2 6/7] pyjailhouse: autogenerate pci_cap_ids.py
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
 <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3630dc76-83db-c00f-dfda-7b8459674453@siemens.com>
Date: Tue, 7 May 2019 20:11:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 07.05.19 00:11, Ralf Ramsauer wrote:
> Convert pci_cap_ids.py to a shell script that should be called with
> cell-config.h.
> 
> The script will extract PCI_CAP_IDs with grep & sed, fill the template and
> print the generated python file. The Makefile will redirect the output to the
> final destination.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   .gitignore                 |  1 +
>   pyjailhouse/pci_cap_ids.py | 67 --------------------------------------
>   tools/Makefile             | 14 ++++++--
>   tools/gen_pci_cap_ids.sh   | 58 +++++++++++++++++++++++++++++++++
>   4 files changed, 71 insertions(+), 69 deletions(-)
>   delete mode 100644 pyjailhouse/pci_cap_ids.py
>   create mode 100755 tools/gen_pci_cap_ids.sh
> 
> diff --git a/.gitignore b/.gitignore
> index 494b9356..678f7436 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -19,6 +19,7 @@ include/jailhouse/config.h
>   hypervisor/hypervisor.lds
>   inmates/lib/arm/inmate.lds
>   inmates/lib/arm64/inmate.lds
> +pyjailhouse/pci_cap_ids.py
>   tools/jailhouse
>   tools/jailhouse-gcov-extract
>   tools/jailhouse-config-collect
> diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
> deleted file mode 100644
> index 3b824718..00000000
> --- a/pyjailhouse/pci_cap_ids.py
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -#
> -# Jailhouse, a Linux-based partitioning hypervisor
> -#
> -# Copyright (c) OTH Regensburg, 2019
> -#
> -# Authors:
> -#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> -#
> -# This work is licensed under the terms of the GNU GPL, version 2.  See
> -# the COPYING file in the top-level directory.
> -
> -from .extendedenum import ExtendedEnum
> -
> -
> -class PCI_CAP_ID(ExtendedEnum):
> -    _ids = {
> -        'PM'     : 0x01, # Power Management
> -        'VPD'    : 0x03, # Vital Product Data
> -        'MSI'    : 0x05, # Message Signalled Interrupts
> -        'HT'     : 0x08, # HyperTransport
> -        'VNDR'   : 0x09, # Vendor-Specific
> -        'DBG'    : 0x0A, # Debug port
> -        'SSVID'  : 0x0D, # Bridge subsystem vendor/device ID
> -        'SECDEV' : 0x0F, # Secure Device
> -        'EXP'    : 0x10, # PCI Express
> -        'MSIX'   : 0x11, # MSI-X
> -        'SATA'   : 0x12, # SATA Data/Index Conf.
> -        'AF'     : 0x13  # PCI Advanced Features
> -    }
> -
> -
> -class PCI_EXT_CAP_ID(ExtendedEnum):
> -    _ids = {
> -        'ERR'     : 0x01, # Advanced Error Reporting
> -        'VC'      : 0x02, # Virtual Channel Capability
> -        'DSN'     : 0x03, # Device Serial Number
> -        'PWR'     : 0x04, # Power Budgeting
> -        'RCLD'    : 0x05, # Root Complex Link Declaration
> -        'RCILC'   : 0x06, # Root Complex Internal Link Control
> -        'RCEC'    : 0x07, # Root Complex Event Collector
> -        'MFVC'    : 0x08, # Multi-Function VC Capability
> -        'VC9'     : 0x09, # same as _VC
> -        'RCRB'    : 0x0A, # Root Complex RB?
> -        'VNDR'    : 0x0B, # Vendor-Specific
> -        'CAC'     : 0x0C, # Config Access - obsolete
> -        'ACS'     : 0x0D, # Access Control Services
> -        'ARI'     : 0x0E, # Alternate Routing ID
> -        'ATS'     : 0x0F, # Address Translation Services
> -        'SRIOV'   : 0x10, # Single Root I/O Virtualization
> -        'MRIOV'   : 0x11, # Multi Root I/O Virtualization
> -        'MCAST'   : 0x12, # Multicast
> -        'PRI'     : 0x13, # Page Request Interface
> -        'AMD_XXX' : 0x14, # Reserved for AMD
> -        'REBAR'   : 0x15, # Resizable BAR
> -        'DPA'     : 0x16, # Dynamic Power Allocation
> -        'TPH'     : 0x17, # TPH Requester
> -        'LTR'     : 0x18, # Latency Tolerance Reporting
> -        'SECPCI'  : 0x19, # Secondary PCIe Capability
> -        'PMUX'    : 0x1A, # Protocol Multiplexing
> -        'PASID'   : 0x1B, # Process Address Space ID
> -        'DPC'     : 0x1D, # Downstream Port Containment
> -        'L1SS'    : 0x1E, # L1 PM Substates
> -        'PTM'     : 0x1F  # Precision Time Measurement
> -    }

Do we really need this back-and-forth? Why not come up with the generator directly?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3630dc76-83db-c00f-dfda-7b8459674453%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
