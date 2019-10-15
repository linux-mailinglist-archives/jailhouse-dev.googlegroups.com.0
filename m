Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBRHTS7WQKGQEKG76YGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id A3182D7C63
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:54:28 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id j2sf1451097wrg.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:54:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571158468; cv=pass;
        d=google.com; s=arc-20160816;
        b=rET06Gioj54lYVAIinbJsYmbaxY23ElcKaaecqLzWfw97mCoiT0fSkji2eUDGDb8t0
         pzQg9U2sg6ryin68Igp8hdaM+Y2aihpNZ+9lFjbC8IIv3vPjbOxgsaLrnN010O808JhY
         5UqCpacYoPX9ZNMkS4+N/sUtdz5GvJBHOUWA0O5iXYU8pBwLl931PZL7KwYnUqvQdYEw
         2DDD6QIal1POprgFXaM0gmj6+PVz/6sbPF1rnIc1qiMc6nMoFEZUdTOSNq3+27ZHQ9m5
         Rusr9tCcdryOkRX1dY2ky/TdHmopXFW5Ype+w0H+ocVP2AeKMKGTmSvPTz4TwsO+SwQC
         LY8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Ut3DGiFoFufriAQlUZKMj5TWE80bw6ZoD95YQOZBJ/s=;
        b=HlgiV5/AgB2dyZQya8ZpvvmPftPRkBVjCc1n/L0A5b3ithgbNxY7KxBbsNWpntm2rG
         K3RkvvCsJkVYXzadW5uedSpBlpwRMcAXzQJ28W9jWfgFaQ4vX+jleWudOxxxR7GeMgiw
         jkkGCgj4mKX6pUwv8uhKVDTpshK33n/9fwUL0BReKt0yjaKaLu2cZzxnooKjgCoPAmsq
         bHLH4uYehbmYHUI9hEf99Org48jJEFS3QExE/Q7W1Jl8qY2wCQsGrZCSVd2ufuGGQGDv
         kZ7QYuKn8HjR69ET/cx+lz/+QMcCb6X0FiejsBr3YwlxM9vwpudPdD6CkeghAgTKPole
         Djew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E+mq8X+p;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ut3DGiFoFufriAQlUZKMj5TWE80bw6ZoD95YQOZBJ/s=;
        b=PLRDfjD9lhwH1ojSVbw9egNaDqISUvIuVIPygpgEJmh3WkdopclKe+x/E9e41WgJJk
         UYXLUooKDLd8gqQib3NtGPm/PejkQ3orgephFacD+d0bxE2e1fOf804TOwek9SUE82hk
         NCwHSFA04upyIm3d1XfxJWa7ZHKuRKnJa4ffo9iRfS2YcnKHk4kjIT/Qcmfh1kflLJcZ
         wqMJl2nBz2RKW/XlrU+6nH5RdUwkUNst3/wPiXEj/AvtGoJ9Vvn7HGBsRwS+BaXXaSwG
         WenrJ07jgGEwmiXQ5NYe5K6zKC41ZF48hxVrrwc4mUXTMS87UB6MD+2s4nMfC4NRnIIs
         qcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ut3DGiFoFufriAQlUZKMj5TWE80bw6ZoD95YQOZBJ/s=;
        b=eNcjUqQUzlDQ/6rFlg6do675kJHgtHp7hSw6+3jRoiovCb4TMoJQErEK4+KOgAkX7u
         XqArjXeeK//gUVwXkM+2ErM57EqyqfTM62s2Pv3vFk722IbWSSJVnWgWturNelluT7tL
         yskg2EAqEUsXISfubc7x7MZ+aG2ELnVuDeZTbvLN8k2EMfZCao14W/kf3USTuL1gX5yO
         CXRgoTlCgOVLePR7QqdhjTazSr8WTYPkw5PVlI3OB1g67Kh6NxdfIdWcpEbM8608e0FE
         ItJOJRvzHgbeN/0S0mavesqETL6BGQvq9KEs59oEcy3Ps8byG+Ex0AaGXLZmlaa/nbg9
         oSbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW1LocKtL9SEDK2yJokqUJAgR+YCIDDOcshsqpYxSWZdLf9/P2z
	sF4zADRoXVqWbFAgFZlci9E=
X-Google-Smtp-Source: APXvYqxvsQS//Bckm7BaedOUywUYkAYERTL4lwkrpUagztseQ/179CwBhepi9LZYuTjZKB2lh3R4ag==
X-Received: by 2002:adf:b69f:: with SMTP id j31mr31078789wre.277.1571158468269;
        Tue, 15 Oct 2019 09:54:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:526c:: with SMTP id l12ls7166427wrc.12.gmail; Tue, 15
 Oct 2019 09:54:27 -0700 (PDT)
X-Received: by 2002:a5d:46ca:: with SMTP id g10mr17188165wrs.193.1571158467658;
        Tue, 15 Oct 2019 09:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571158467; cv=none;
        d=google.com; s=arc-20160816;
        b=qxg1ZaF42zo66OJcwxYobIAaiLrfelwjUq3uHaQhcX2nKwu3Gi8kJhEg8zOjpnxnTs
         9wHk9CmTeBU1fzHIr1p20y/LggH/kjX2tbi/nefMZvs8DLP8S8cuoi9nOZIZKYyxGBMV
         nfDJraM4kfexXZRcpv/RGKXQAOBvZOoQeP3Uc5MtgnO4zp6blikWdTekXA10FOl6ysNr
         Pxl4MsvRso4GbeMrXUhpS36fC4KF0Noil4Y/H3LWYwTTMG56h7ejEwdUNM8+qYcqs5kr
         pKe4EEEihO/ByMNASkLoYzETZJ4aIDytrUsXICtPikFTxlhAo5iKddj66l1XLZNRkVX2
         Mhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=CQtP/3lsm6tPmgROXYmKplqPYHHgASVB+JXVS5oRRh0=;
        b=GQaB5MMNdpmw5SgPobSVMUCWw7SfpXBVjl7tGtD0LWhjyv632zhiIAY7vRW15k1Rdn
         u+K9IJRxJd59oMBgI2qepn3fDrkT+sbH3KXtsDI+JFkXt8X/G7zZj6qd8B2lWMj7oYco
         dTcG4Ay81ceoqMYdev+BGNIxWeZyIcohJ1DRj/JnJTxl6BOcL3LbS1hW6o+41GPjFvPv
         zLPwS5jArh2iU5a2Svxdr872LIA2jglDll5feSHvMMZPbK6gspDZC5M2m/eTF0dHN15x
         U9qQU/UI1mjrModh9NrRZWdfKckWRFM3J6eZ2ilh6cITsHRPkvJemD6hEfecQwWkD0o8
         NRSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E+mq8X+p;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id n16si1403466wrs.4.2019.10.15.09.54.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46t1jv1nkRzy8J;
	Tue, 15 Oct 2019 18:54:27 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 15 Oct
 2019 18:54:27 +0200
Subject: Re: [PATCH v4 12/13] pyjailhouse: x86: implement pio_regions
 generator
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
 <20191015162242.1238940-13-ralf.ramsauer@oth-regensburg.de>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <db6fdd43-f6f4-62b2-cfe6-d2113b99f74b@st.oth-regensburg.de>
Date: Tue, 15 Oct 2019 18:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015162242.1238940-13-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-CH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E+mq8X+p;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Hi Ralf,

On 15.10.19 18:22, Ralf Ramsauer wrote:
> From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> 
> This replaces the former static port list with actual port regions as listed in
> /proc/ioports.
> 
> A whitelist selectively allows access to known ports (if present). PCI devices
> above 0xcff are permitted as well.
> 
> However, not all ports that are in use are listed in ioports, so the generated
> list may still ne further tuning.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> [ralf: s/permitted/whitelist/, autodetect VGA, whitelist serial,
>         whitelist PCI devices, amend commit message, improve __str__ methods,
>         ensure pep8 conformity]
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py   | 89 +++++++++++++++++++++++++++++++++++
>   tools/jailhouse-config-create | 15 +-----
>   tools/root-cell-config.c.tmpl | 12 ++---
>   3 files changed, 96 insertions(+), 20 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 1d00f364..3cefc2c7 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -18,6 +18,7 @@
>   # to change the generated C-code.
>   
>   
> +import re
>   import struct
>   import os
>   import fnmatch
> @@ -25,6 +26,7 @@ import fnmatch
>   from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
>   
>   root_dir = "/"
> +bdf_regex = re.compile(r'\w{4}:\w{2}:\w{2}\.\w')
>   
>   
>   def set_root_dir(dir):
> @@ -147,6 +149,65 @@ def parse_iomem(pcidevices):
>       return ret, dmar_regions
>   
>   
> +def ioports_search_pci_devices(tree):
> +    ret = []
> +
> +    if tree.region and bdf_regex.match(tree.region.typestr):
> +        ret.append(tree.region)
> +    else:
> +        for subtree in tree:
> +            ret += ioports_search_pci_devices(subtree)
> +
> +    return ret
> +
> +
> +def parse_ioports():
> +    tree = IORegionTree.parse_io_file('/proc/ioports', PortRegion)
> +
> +    pm_timer_base = tree.find_regions_by_name('ACPI PM_TMR')
> +    if len(pm_timer_base) != 1:
> +        raise RuntimeError('Found %u entries for ACPI PM_TMR (expected 1)' %
> +                           len(pm_timer_base))
> +    pm_timer_base = pm_timer_base[0].start
> +
> +    leaves = tree.get_leaves()
> +
> +    # Never expose PCI config space ports to the user
> +    leaves = list(filter(lambda p: p.start != 0xcf8, leaves))
> +
> +    # Drop everything above 0xd00
> +    leaves = list(filter(lambda p: p.start < 0xd00, leaves))
> +
> +    whitelist = [
> +        0x40,   # PIT
> +        0x60,   # keyboard
> +        0x61,   # HACK: NMI status/control
> +        0x64,   # I8042
> +        0x70,   # RTC
> +        0x2f8,  # serial
> +        0x3f8,  # serial

I see you added the onboard UARTs to the whitelist. Shouldn't we 
disallow them if they collide with Jailhouse' own debug port?

Thanks,
Andrej Utz

> +    ]
> +
> +    pci_devices = ioports_search_pci_devices(tree)
> +
> +    # Drop devices below 0xd00 as leaves already contains them. Access should
> +    # not be permitted by default.
> +    pci_devices = list(filter(lambda p: p.start >= 0xd00, pci_devices))
> +    for pci_device in pci_devices:
> +        pci_device.permit = True
> +
> +    for r in leaves:
> +        typestr = r.typestr.lower()
> +        if r.start in whitelist or \
> +           True in [vga in typestr for vga in ['vesa', 'vga']]:
> +            r.permit = True
> +
> +    leaves += pci_devices
> +    leaves.sort(key=lambda r: r.start)
> +
> +    return leaves, pm_timer_base
> +
> +
>   def parse_pcidevices():
>       int_src_cnt = 0
>       devices = []
> @@ -831,6 +892,19 @@ class MemRegion(IORegion):
>           return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
>   
>   
> +class PortRegion(IORegion):
> +    def __init__(self, start, stop, typestr, permit=False, comments=None):
> +        super(PortRegion, self).__init__(start, stop, typestr, comments)
> +        self.permit = permit
> +
> +    def __str__(self):
> +        return 'Port I/O: %04x-%04x : %s' % \
> +            (self.start, self.stop, super(PortRegion, self).__str__())
> +
> +    def size(self):
> +        return super(PortRegion, self).size() + 1
> +
> +
>   class IOAPIC:
>       def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
>           self.id = id
> @@ -854,6 +928,21 @@ class IORegionTree:
>           self.parent = None
>           self.children = []
>   
> +    def __iter__(self):
> +        for child in self.children:
> +            yield child
> +
> +    def get_leaves(self):
> +        leaves = []
> +
> +        if len(self.children):
> +            for child in self.children:
> +                leaves.extend(child.get_leaves())
> +        elif self.region is not None:
> +            leaves.append(self.region)
> +
> +        return leaves
> +
>       # find specific regions in tree
>       def find_regions_by_name(self, name):
>           regions = []
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index c3226dde..250785af 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -162,18 +162,6 @@ def count_cpus():
>               count += 1
>       return count
>   
> -
> -def parse_ioports():
> -    pm_timer_base = None
> -    f = sysfs_parser.input_open('/proc/ioports')
> -    for line in f:
> -        if line.endswith('ACPI PM_TMR\n'):
> -            pm_timer_base = int(line.split('-')[0], 16)
> -            break
> -    f.close()
> -    return pm_timer_base
> -
> -
>   class MMConfig:
>       def __init__(self, base, end_bus):
>           self.base = base
> @@ -302,7 +290,7 @@ mem_regions.append(inmatereg)
>   
>   cpucount = count_cpus()
>   
> -pm_timer_base = parse_ioports()
> +port_regions, pm_timer_base = sysfs_parser.parse_ioports()
>   
>   debug_console = DebugConsole(options.console)
>   
> @@ -312,6 +300,7 @@ tmpl = Template(filename=os.path.join(options.template_dir,
>                                         'root-cell-config.c.tmpl'))
>   kwargs = {
>       'mem_regions': mem_regions,
> +    'port_regions': port_regions,
>       'ourmem': ourmem,
>       'argstr': ' '.join(sys.argv),
>       'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index d884089a..8f654fa7 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -47,7 +47,7 @@ struct {
>   	__u64 cpus[${int((cpucount + 63) / 64)}];
>   	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>   	struct jailhouse_irqchip irqchips[${len(irqchips)}];
> -	struct jailhouse_pio pio_regions[6];
> +	struct jailhouse_pio pio_regions[${len([1 for r in port_regions if r.permit])}];
>   	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
>   	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
>   } __attribute__((packed)) config = {
> @@ -154,12 +154,10 @@ struct {
>   	},
>   
>   	.pio_regions = {
> -		PIO_RANGE(0x40, 4), /* PIT */
> -		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
> -		PIO_RANGE(0x64, 1), /* I8042 */
> -		PIO_RANGE(0x70, 2), /* RTC */
> -		PIO_RANGE(0x3b0, 0x30), /* VGA */
> -		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
> +		% for r in port_regions:
> +		/* ${str(r)} */
> +		${'' if r.permit else '/* '}PIO_RANGE(${r.start_str()}, ${r.size_str()}),${'' if r.permit else ' */'}
> +		% endfor
>   	},
>   
>   	.pci_devices = {
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/db6fdd43-f6f4-62b2-cfe6-d2113b99f74b%40st.oth-regensburg.de.
