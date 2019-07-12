Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3O4ULUQKGQEYSM23TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE8672DC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 17:59:42 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id m23sf8213510edr.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 08:59:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562947182; cv=pass;
        d=google.com; s=arc-20160816;
        b=KTYHW4uiq/rDtfNDTQs/OlXNZFL+KlpBLM6ESxldv9EvierLlI6lUq/iFI0aKXenUc
         hJsew29N1wLROq1WmEbPJ0S+fAPAoSsgc0297mFwG7mUNOAm3zleDNSb0kjO+g7nOQrK
         y6ZX7faJ+vkGuZFFvjJV4fmEljVOD0ygOyDnRe4O7TbkR0UaKlW7On8DoO/SA7+yFfad
         Nu+gzOR9rRk3Rfd959nbnQu7qE8fkDZgu5XcKoWQmRLXz77eEPSVCNTFkkhm3+syjL+D
         vdMOjX8YorOUT6nKNnS4KVX8gR+lVPbEnWZMsVM5c+JkwLf6YjEgO3tI0usR+UyHbadj
         +mlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=ZmtwkwDcOcYk67Hts6F8YGMlBO9Ykj4OUf7/EAnjSM8=;
        b=rPUHTbL0tCLc0JTKAj1EPnl3Y6Kkx71qyMHdK6JrmGc2Gj7i2XK9xG587HvYsfhcJG
         /avhRePov+y11xXjBS7M2dEPtHFjKNpNsiOesY1Y2tdA7Dgt6LdZIW4ipLwb/h8dJ5/O
         9MbT9DRaVrJXH2purkfOjTRPami3+XWi+gaLYMNGr506wEI375LprUNyWtSbnaNzF8hY
         xIN0dfNBbsSTmzogecPrxwbkXsWiXRGTml3Be0OptDYkjpZuDBfv3tOy09cXiCg2J4eg
         wdGzOxiNe1b83l2NeYmtux+485TyNP50Iid7ju34I6g82+8pl8UKRkheUmkyn1DvLcOT
         zrDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RMDTzuSo;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZmtwkwDcOcYk67Hts6F8YGMlBO9Ykj4OUf7/EAnjSM8=;
        b=oj6jx2P/K1BgN8eNE1y88UdBNrC8qai8uCKux06CUWBnRz25KD+rNm5JcdtrEyxciE
         HaAUE950BQhVD/ekVRwUiIrfYQ3vA2ZxCGcscftPAyIlyPJ1KHDCEQ7F6IiUdtr9lKnz
         vOvhp1pQT0t+HnjEWQuEsoaQFV8/hLT3bchKThhE2ZfHD1dLXVGBCPRKSsni9oz5mzTu
         42PyKiaGwfmOLkMjfmuOojgxNfBnTjY3Ymw/cmZKwqZX+T0W69HLxoyB9ZK+XtStnhrF
         PcWhFwOrsYGccqO/DDbfmPbGRDTwRLzCzk/xXmMS8VCh6iZ90ZRwaiwcok2sQKkYdvbU
         1Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZmtwkwDcOcYk67Hts6F8YGMlBO9Ykj4OUf7/EAnjSM8=;
        b=WTjsnhkpvFfPmuP6dlx4b3OQXtyiLNoUc3McWtC+XENQ3ECPtrGi18XkbQCm5M2ClR
         W8Yj21vEbucQFK6oP8QhIzX4jbEB9a03FcPCQ0b73hvr4kZgHH/KEfXgPLdqHyaihJHG
         vOm+plMgTeHxKQVKld7uX5tezTBCij2l93JT6EXWmRW96zJN9cFZCFO1CXbEIWOJrU6O
         cH/5OBtNpIwrXqpXv9dWSxGc/NxlNUMTNK03mAFu1IToptWlJqERe9SIj7tRnOiWXXT/
         qiaH/GyNPMAfZM1fMfsrNiLDrswYhvMtZeqaGfEd3loO1aXLhrf/sp7T//Kj47bpmXLZ
         A0Cg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXhfANxXcmQoaPxLZup7u2aXa6B2Ru48r73r7K4eJkXEwVZ77Q/
	SgE1NnxsqxgDf1TX644y5VY=
X-Google-Smtp-Source: APXvYqwlBpMHpfBXZNDGRJnB7ZiS4qmYtBvifHbUPq7GL0p8FyIjtVd/lknds2w/lieZ1FN3QvqVCA==
X-Received: by 2002:a50:b1e7:: with SMTP id n36mr10116911edd.227.1562947182169;
        Fri, 12 Jul 2019 08:59:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls2172969ejr.1.gmail; Fri, 12
 Jul 2019 08:59:41 -0700 (PDT)
X-Received: by 2002:a17:906:c459:: with SMTP id ck25mr8789417ejb.32.1562947181213;
        Fri, 12 Jul 2019 08:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562947181; cv=none;
        d=google.com; s=arc-20160816;
        b=BdPWxdW4zSQ2wsf1dLFzjzcpVVzPGHbNGa2AYpG4ZxobhN2OWTqkn0xRjnxfEH4BJk
         qouUttPylvLhHQQGNFkwq+nqrAcTSHEScqDnj49DNsgo5B0akT6BV1+5uYZx8ofYv0Mu
         S9EO5XlSQ2bVwUrAlBtmTnSn4EMdE0Ukk/s7mQ7/v+F5CUl/tzmZBTXJSm5AjmdMSUT6
         zM4IiVH43YJIntkkxKZixU4VGs8Us36S5PLI7fhi2XplNlNqK3UoJZnWlCgzZ1Zfz7RK
         QcXXtQzP7aEloNsNACcwPnDJucNkUJXQq8z5WxAyMgLT3ixAAc+loVzwsxH2NFTNxeot
         4jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=sVyOmF9kEyuzxfvBSgp+a4Bgzg/8lMIqItUYwUCTc6k=;
        b=RM1WIpX2wyfAIR17VFdaf3t8Ysvo7JZcs/YPFOleoL7WPFuhz6Sq77WOlTOkF/MPDe
         vLouwlDQwZuh515NCNjRVAqum9wCqypG5YVr23YudvCEyLo3cIv+GKRcYSMtgsxKvYJF
         LAR/bqG01KpjwO6x1ZzWcTyf/jxvyXW/ANc0/RBnH7McnzO+JsGI46VKVQ64nydUuLBR
         7k+sV2ugUcjzcca22haIeJ+2LKVqUSk3hRlo3d+MOar5qBWNdykMkJS/mfuCiLSvjDuO
         mlXZTJB5yWy6qQyYmjcjIbJNR6FC2DLte9z37f9EWC5EWL1rW9OCi6t7Ic3QLFejrth9
         iufg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RMDTzuSo;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id a41si542369edc.5.2019.07.12.08.59.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 08:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45ld0X573jzxvw;
	Fri, 12 Jul 2019 17:59:40 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 12 Jul
 2019 17:59:40 +0200
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@web.de>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
 <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <e369a4a6-57cf-3fae-a68c-3351394da184@oth-regensburg.de>
Date: Fri, 12 Jul 2019 17:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RMDTzuSo;
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

On 6/21/19 12:06 AM, Andrej Utz wrote:
> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and override
> the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but eases
> manual configuration.

just found a bug in this series. This series creates regions such as:

<snip>
[  0x80/8 ...   0x87/8] =   -1, /* 0080-0087 : dma page reg */
[  0x88/8 ...   0x8f/8] =   -1, /* 0088-008f : dma page reg */
[  0xa0/8 ...   0xa7/8] =   -1, /* 00a0-00a1 : pic2 */
<snip>

Now we have a hole between [0x90/8 ... 0x1f/8]. A hole means that this
area will be initialised with zero -> access is permitted.

Root of this bug: In addition known port regions, we must also respect
unknown port regions and deny access.

@Jan: This brings me to an idea. The TODO says that whitelist-based MSR
bitmaps are a v1.0 target. I think the PIO bitmap would also benefit if
it would be whitelist based. Do you agree?

E.g.:
.pio_bitmap = {
	[ 0x3f8/8 ... 0x3ff/8 ] = -1,
},

would denote that only access to 3f8-3ff is allowed. All other ports are
denied. Much easier to write and understand.

  Ralf


> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 150 ++++++++++++++++++++++++++++++++++
>  tools/jailhouse-config-create |  26 ++----
>  tools/root-cell-config.c.tmpl |  31 ++++---
>  3 files changed, 176 insertions(+), 31 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index d612c6d3..ce490236 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -141,6 +141,52 @@ def parse_iomem(pcidevices):
>  
>      return ret, dmar_regions
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
>  def parse_pcidevices():
>      int_src_cnt = 0
> @@ -772,6 +818,85 @@ class MemRegion:
>          return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
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
>  class IOAPIC:
>      def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
>          self.id = id
> @@ -935,6 +1060,31 @@ class IOMapTree:
>  
>          return regions, dmar_regions
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
>  class IOMMUConfig:
>      def __init__(self, props):
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index 55601a6d..d154ec44 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -162,18 +162,6 @@ def count_cpus():
>              count += 1
>      return count
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
>  class MMConfig:
>      def __init__(self, base, end_bus):
>          self.base = base
> @@ -269,7 +257,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
>  inmatemem = kmg_multiply_str(options.mem_inmates)
>  hvmem = [0, kmg_multiply_str(options.mem_hv)]
>  
> -(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
> +(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
>  ourmem = parse_kernel_cmdline()
>  total = hvmem[1] + inmatemem
>  
> @@ -283,11 +271,11 @@ if vendor == 'GenuineIntel':
>                                                             dmar_regions)
>  else:
>      (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pcidevices, ioapics)
> -regions += extra_memregs
> +mem_regions += extra_memregs
>  
>  # kernel does not have memmap region, pick one
>  if ourmem is None:
> -    ourmem = alloc_mem(regions, total)
> +    ourmem = alloc_mem(mem_regions, total)
>  elif (total > ourmem[1]):
>      raise RuntimeError('Your memmap reservation is too small you need >="' +
>                         hex(total) + '". Hint: your kernel cmd line needs '
> @@ -298,20 +286,20 @@ hvmem[0] = ourmem[0]
>  inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
>                                     ourmem[0] + hvmem[1] + inmatemem - 1,
>                                     'JAILHOUSE Inmate Memory')
> -regions.append(inmatereg)
> +mem_regions.append(inmatereg)
>  
>  cpucount = count_cpus()
>  
> -pm_timer_base = parse_ioports()
> +(port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
>  
>  debug_console = DebugConsole(options.console)
>  
> -
>  f = open(options.file, 'w')
>  tmpl = Template(filename=os.path.join(options.template_dir,
>                                        'root-cell-config.c.tmpl'))
>  kwargs = {
> -    'regions': regions,
> +    'mem_regions': mem_regions,
> +    'port_regions': port_regions,
>      'ourmem': ourmem,
>      'argstr': ' '.join(sys.argv),
>      'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index b6ac8637..9f65a72a 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -45,7 +45,7 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[${int((cpucount + 63) / 64)}];
> -	struct jailhouse_memory mem_regions[${len(regions)}];
> +	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>  	struct jailhouse_irqchip irqchips[${len(irqchips)}];
>  	__u8 pio_bitmap[0x2000];
>  	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
> @@ -125,7 +125,7 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		% for r in regions:
> +		% for r in mem_regions:
>  		/* ${str(r)} */
>  		% for c in r.comments:
>  		/* ${c} */
> @@ -153,18 +153,25 @@ struct {
>  	},
>  
>  	.pio_bitmap = {
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
>  	},
>  
> +
>  	.pci_devices = {
>  		% for d in pcidevices:
>  		/* ${str(d)} */
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e369a4a6-57cf-3fae-a68c-3351394da184%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
