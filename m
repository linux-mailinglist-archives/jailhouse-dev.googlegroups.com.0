Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE5AWPUAKGQEEHTKCCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1FE4E823
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 14:39:47 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id s5sf9041165eda.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 05:39:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561120787; cv=pass;
        d=google.com; s=arc-20160816;
        b=nPbquH7twePvYgkpHQDtElqOmUfJvgTqtQ4KTql+mjOaKOKxYVRQCBPTHKhCVhThoy
         WR0teGWkej+3LG1TtQv3ZQU5ww0oLBMKDXzNDb6B1Av2W0mbdUzNQg5k1OPXGL/zcP0F
         468DYwGzvBjiGrexekyZfZFUyrEHKTURdYa687zTdpLsnd3fZEq9SIAsiZVqnWdDbp5O
         I6f1/Y2wXrPESjA9OjYrFpygIBZnlr0wb7ssb6bSdtQWHwgzTIyD9QBtEX3lhDJEAloK
         yZVKrG8A57T5evnVFBj6dPg2KUyiFmgtLBwoEHnqSeb3uB3X+Cv/0DKHiEQM6T+Uzy+e
         dsYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=cHhA/WyJAQP9DXrQTi9NdFQnni3t+/8G/PRGzZi27Ec=;
        b=Qm+YxQJ9ViV8W6t2uFAHroDIKJ+LerT93j+LugQAjphTnIkxZDIy6QfeH6AkKN4RM8
         KiZRtN8JnWpaLvpGGzk6fs2jSVMD8lCHxW4CQ6HTXbldlbJqGHdsIrVBsxhJnwvxnOf6
         guEpgdfknMn8VCXivwYrPJvS+8D0vGuHTtsxlWDAm3uHG5ZEztO50mOh9+tki2LEmGtT
         bq83J7nYcJBGHLtc3LtvOgDdQdFs3rklrUjwhHXO6Ra7vBUu6IoaXsoXOj2noBKIOprS
         f643M6+XN2JoHg+8UPE1Wsif6drTIAo17sp7+YIYJr6yr7ok8prZOpeiJnrRNO61z+0k
         Q77A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cHhA/WyJAQP9DXrQTi9NdFQnni3t+/8G/PRGzZi27Ec=;
        b=mJ4yCAtuDrwXdhJ+L4kWONpbjAANRHb/dyX0hdY3NbeOw5en2TuhiAjnTewhEPpHra
         wtNWbsB/PUpzt3W+6mCpfrvccjOZ8SDWk1jo/p8JK3mt8+g5l1x7aNAT/Xi8mtkdNRuy
         llg4VYgkYBnJFJGU/E+twT2n6O4+WmPnVVgKz62WXzlF719qtnnId7SAtDiZYMBi7w4F
         wI8YPUTYo7XIgBbIQeVTJk9n3E4+ukMarzxq3lTOX/01t73o8OuUnQS+TNuC5lDmel3U
         AQq27Taz1wlisQ+wljbKrwoLjYM17OT7wgkapdDvYvCnbzWCNVoKSGdBg5domQIBrkcb
         8Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cHhA/WyJAQP9DXrQTi9NdFQnni3t+/8G/PRGzZi27Ec=;
        b=DSqgz8rEiymNr7AoqndJROnEmqIPMaCyiBU4eani4ycjSmoeFwKQV6RDRb1VNWi5AM
         5CJ83r7BEoIvMmRbaoEGOfNfM86i5DZ19oYtHzhqtVnoX4uzHI8yQxzJNuSTPiksb6bF
         AcSyao01y5eBbzSOkSGWcMMK9z4FFSfIW8X79/nds6Y6bzGRiuR0b9J/EvoIBojTibPT
         2KIuDQlLEq8zfpH9K+eUipafWKMQI0BliDLYHVEpTE8U+3uIkSBJEQ7IZvMgaEuhHS0t
         nMqTxU0XwQycUIrteEFSSBJqXPCmtNFp03ebDMPWwzG4V+D7t15Kok4ae6uWbjiRXufY
         mBog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJ1cGb3wAmDFlW+OvZhcjv/H6gb2vCRC3OgPJOpUwz72hBXbkk
	WULxDoKbVNvTnwsYsw4Yh9Q=
X-Google-Smtp-Source: APXvYqzrLRH4ErIBUxyAKQstubQQwVQTKmkJX2ImzoSt/L57BWYfkhVNtgVa6ikDToyiVdrij/jrxw==
X-Received: by 2002:a50:b635:: with SMTP id b50mr52162477ede.293.1561120787681;
        Fri, 21 Jun 2019 05:39:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:908a:: with SMTP id c10ls2793054eda.14.gmail; Fri, 21
 Jun 2019 05:39:47 -0700 (PDT)
X-Received: by 2002:a50:9729:: with SMTP id c38mr122940212edb.283.1561120787113;
        Fri, 21 Jun 2019 05:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561120787; cv=none;
        d=google.com; s=arc-20160816;
        b=dkUBaFIEvEKPk7rnY0LS8kPvhw1YVO/u6W9F808E8MBTG5AeS7HSzsIKojybzsaUgA
         KJgbE19H8XWkBb5FWNNSo5zLGLNLpAnuRoh0iaFBIlOBHLBZqjN/xhmFh5ozJMhKYyL/
         KPpFge/zuRavyIWHD1QH+jc5BDDnpnFePhE70A9pUVUUhlqKl1J+iXJuHHqIC6pz+9E/
         2l22aXYYNUkcQrv5mMWeFiRF97pUrCmglVh5n86S1uQrMP93kUFhvvU9P/r7s68S4XBo
         aJfEDtOmfW0K4WumWWVlQKhndP4fMAVsGEgBN7Q/1295rJqqw6SLm/cib+vMrtnKBh7+
         o4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hnJ5iLJI076bKnLByPYoxV2aiUj6lojqgxVck9Zo3yw=;
        b=zlP+JJAluK1cvUF8B3AOsbw9Q7AdZ1dfmQv0KG3O33O3dq1IiPXRp9B6YQrZjJX19H
         wWydH0Bt3EPjTZZZw2HUMab9esmTpx1ZHQVU9SkEou9uDcuYCgXOzYqzigtgvSfhCpKA
         nS4Ov/sPoQu7fuCjE7chkPFFA3TkpnUXNvpJha8B2MkOGOYnLKQauPa2A7lo/cbsuBK0
         r2AL9JWaI0yHJWVcb5MLkqxBVx+UY/pEF7A1KPCQh28R/0FMtaAvmm8B+o4MiA06ezi9
         M70cC5cg01eelGim0Mtxg6NgTCo2rmHKBKqQW+U5Cd7+CmBnyHB5EIvmgo+oaQnO8iFU
         n+rg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t15si33184ejq.1.2019.06.21.05.39.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 05:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5LCdk5t028030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2019 14:39:46 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5LCdknO022163;
	Fri, 21 Jun 2019 14:39:46 +0200
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
 <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4811c2a0-b686-9b15-4843-720ff34e3f86@siemens.com>
Date: Fri, 21 Jun 2019 14:39:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
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

On 21.06.19 00:06, Andrej Utz wrote:
> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and override
> the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but eases
> manual configuration.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py   | 150 ++++++++++++++++++++++++++++++++++
>   tools/jailhouse-config-create |  26 ++----
>   tools/root-cell-config.c.tmpl |  31 ++++---
>   3 files changed, 176 insertions(+), 31 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index d612c6d3..ce490236 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -141,6 +141,52 @@ def parse_iomem(pcidevices):
>   
>       return ret, dmar_regions
>   
> +def parse_ioports():
> +    regions = IOMapTree.parse_ioports_tree(
> +        IOMapTree.parse_iomap_file('/proc/ioports', PortRegion))
> +
> +    tmp = [
> +        # static regions
> +        PortRegion(0x0, 0x3f, ''),
> +        PortRegion(0x40, 0x43, 'PIT', allowed=True),
> +        PortRegion(0x60, 0x61, 'NMI', allowed=True, comments=["HACK!"]), # NMI status/control
> +        PortRegion(0x64, 0x64, 'NMI', allowed=True, comments=["HACK!"]), # ditto
> +        PortRegion(0x70, 0x71, 'RTC', allowed=True),
> +        PortRegion(0x3b0, 0x3df, 'VGA', allowed=True),
> +        PortRegion(0xd00, 0xffff, 'PCI bus', allowed=True),
> +    ]
> +
> +    pm_timer_base = None
> +    for r in regions:
> +        if r.typestr == 'ACPI PM_TMR':
> +            pm_timer_base = r.start
> +
> +        tmp.append(r)
> +
> +    tmp.sort(key=lambda r: r.start)
> +    ret = [ tmp[0] ]
> +
> +    # adjust overlapping regions
> +    for r in tmp[1:]:
> +        prev = ret[-1]
> +
> +        # combine multiple regions under the same bit mask
> +        if prev.aligned_stop() >= r.aligned_start():
> +            if r.stop > prev.stop:
> +                n = prev
> +                while n.neighbor != None:
> +                    n = n.neighbor
> +                n.neighbor = r
> +            continue
> +
> +        # forbid access to unrecognized regions
> +        if prev.aligned_stop() - r.aligned_start() > 0:
> +            ret.append(
> +                PortRegion(prev.aligned_stop() + 1, r.aligned_start() - 1, ''))
> +
> +        ret.append(r)
> +
> +    return (ret, pm_timer_base)
>   
>   def parse_pcidevices():
>       int_src_cnt = 0
> @@ -772,6 +818,85 @@ class MemRegion:
>           return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
>   
>   
> +class PortRegion:
> +    def __init__(self, start, stop, typestr, comments=None, allowed=False):
> +        self.start = start
> +        self.stop = stop
> +        self.typestr = typestr or ''
> +        self.comments = comments or []
> +        self.allowed = allowed
> +        self.neighbor = None
> +
> +    def __str__(self):
> +        # as in MemRegion this method is purely for C comment generation
> +
> +        # remove consecutive duplicates
> +        neighbor = self.neighbor
> +        stop = self.stop
> +        ns = ''
> +        while neighbor:
> +            if self.typestr != neighbor.typestr \
> +            or self.comments != neighbor.comments:
> +                ns += ', ' + str(neighbor)
> +                break
> +
> +            stop = neighbor.stop
> +            neighbor = neighbor.neighbor
> +
> +        s = ''
> +        # pretty print single ports
> +        if self.start == stop:
> +            s += '%5s' % ''
> +        else:
> +            s += '%04x-' % self.start
> +
> +        s += '%04x' % stop
> +
> +
> +        if self.typestr:
> +            s += ' : ' + self.typestr
> +
> +        if self.comments:
> +            s += ' (' + ', '.join(c for c in self.comments) + ')'
> +
> +        s += ns
> +        return s
> +
> +    # used in root-cell-config.c.tmpl
> +    def is_combined(self):
> +        neighbor = self.neighbor
> +        while neighbor:
> +            if self.typestr != neighbor.typestr:
> +                return True
> +
> +            neighbor = neighbor.neighbor
> +
> +        return False
> +
> +    def size(self):
> +        return self.stop - self.start
> +
> +    def aligned_start(self):
> +        return self.start - self.start % 8
> +
> +    def aligned_stop(self):
> +        return self.stop + (7 - self.stop % 8)
> +
> +    def bits(self):
> +        # in this method: 0 = disallowed,
> +        # in config: 0 = allowed
> +        if self.allowed:
> +            bits = ((1 << (self.size() + 1)) - 1) << \
> +                (self.start - self.aligned_start())
> +        else:
> +            bits = 0
> +
> +        if self.neighbor:
> +            bits |= ~self.neighbor.bits()
> +
> +        return ~bits & 0xFF
> +
> +
>   class IOAPIC:
>       def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
>           self.id = id
> @@ -935,6 +1060,31 @@ class IOMapTree:
>   
>           return regions, dmar_regions
>   
> +    # recurse down the tree
> +    @staticmethod
> +    def parse_ioports_tree(tree):
> +        regions = []
> +
> +        for tree in tree.children:
> +            r = tree.region
> +            s = r.typestr
> +
> +            if len(tree.children) > 0:
> +                regions.extend(IOMapTree.parse_ioports_tree(tree))
> +                continue
> +
> +            # split in byte sized regions
> +            while r.size() > 8:
> +                # byte-align r.stop
> +                sub = PortRegion(r.start, r.start + 7 - r.start % 8, r.typestr)
> +                regions.append(sub)
> +                r.start = sub.stop + 1
> +
> +            # add all remaining leaves
> +            regions.append(r)
> +
> +        return regions
> +
>   
>   class IOMMUConfig:
>       def __init__(self, props):
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index 55601a6d..d154ec44 100755
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
> @@ -269,7 +257,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
>   inmatemem = kmg_multiply_str(options.mem_inmates)
>   hvmem = [0, kmg_multiply_str(options.mem_hv)]
>   
> -(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
> +(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
>   ourmem = parse_kernel_cmdline()
>   total = hvmem[1] + inmatemem
>   
> @@ -283,11 +271,11 @@ if vendor == 'GenuineIntel':
>                                                              dmar_regions)
>   else:
>       (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pcidevices, ioapics)
> -regions += extra_memregs
> +mem_regions += extra_memregs
>   
>   # kernel does not have memmap region, pick one
>   if ourmem is None:
> -    ourmem = alloc_mem(regions, total)
> +    ourmem = alloc_mem(mem_regions, total)
>   elif (total > ourmem[1]):
>       raise RuntimeError('Your memmap reservation is too small you need >="' +
>                          hex(total) + '". Hint: your kernel cmd line needs '
> @@ -298,20 +286,20 @@ hvmem[0] = ourmem[0]
>   inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
>                                      ourmem[0] + hvmem[1] + inmatemem - 1,
>                                      'JAILHOUSE Inmate Memory')
> -regions.append(inmatereg)
> +mem_regions.append(inmatereg)
>   
>   cpucount = count_cpus()
>   
> -pm_timer_base = parse_ioports()
> +(port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
>   
>   debug_console = DebugConsole(options.console)
>   
> -
>   f = open(options.file, 'w')
>   tmpl = Template(filename=os.path.join(options.template_dir,
>                                         'root-cell-config.c.tmpl'))
>   kwargs = {
> -    'regions': regions,
> +    'mem_regions': mem_regions,
> +    'port_regions': port_regions,
>       'ourmem': ourmem,
>       'argstr': ' '.join(sys.argv),
>       'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index b6ac8637..9f65a72a 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -45,7 +45,7 @@
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[${int((cpucount + 63) / 64)}];
> -	struct jailhouse_memory mem_regions[${len(regions)}];
> +	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>   	struct jailhouse_irqchip irqchips[${len(irqchips)}];
>   	__u8 pio_bitmap[0x2000];
>   	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
> @@ -125,7 +125,7 @@ struct {
>   	},
>   
>   	.mem_regions = {
> -		% for r in regions:
> +		% for r in mem_regions:
>   		/* ${str(r)} */
>   		% for c in r.comments:
>   		/* ${c} */
> @@ -153,18 +153,25 @@ struct {
>   	},
>   
>   	.pio_bitmap = {
> -		[     0/8 ...   0x3f/8] = -1,
> -		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
> -		[  0x48/8 ...   0x5f/8] = -1,
> -		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
> -		[  0x68/8 ...   0x6f/8] = -1,
> -		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
> -		[  0x78/8 ...  0x3af/8] = -1,
> -		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
> -		[ 0x3e0/8 ...  0xcff/8] = -1,
> -		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
> +		% for r in port_regions:
> +		% if r.is_combined():
> +
> +		% for c in str(r).split(', '):
> +		/* ${c} */
> +		% endfor
> +		% endif
> +		[${
> +			'%6s' % hex(r.aligned_start())}/8 ... ${
> +			'%6s' % hex(r.aligned_stop())}/8] = ${
> +			'%4s' % ('0' if r.bits() == 0 else \
> +					'-1' if r.bits() == 0xff else \
> +					hex(r.bits()))}, ${
> +			('/* %s */' % str(r)) if not r.is_combined() else '\n'
> +		}
> +		% endfor
>   	},
>   
> +
>   	.pci_devices = {
>   		% for d in pcidevices:
>   		/* ${str(d)} */
> 

Thanks for these patches! Look good on first sight (except for one stray 
new-line in the hunk above). I will dig into details after the upcoming release.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4811c2a0-b686-9b15-4843-720ff34e3f86%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
