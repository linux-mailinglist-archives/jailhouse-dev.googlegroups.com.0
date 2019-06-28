Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB3E727UAKGQELD4MB4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id CE24759618
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 10:29:32 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id i71sf1189355wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Jun 2019 01:29:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561710572; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Dl0wBsKqpGSOX56hgowhkfUzYoeDO/UKx0DyQuCz3mhd/wh2HPjibnl7otrV7zMNG
         H61aNfif7Dy0e+Iy4FTlSMfEv1z1uWWbb/BYd0HIgbEhbfj0pG8wHgbC4JutggD6n7ha
         VPYmw3IY1ju94tClzAu/9kGGP80N8niOjJ7r4jRTTYbo3A/8VxicP3PuAVYpLEkFhL2e
         7I9ofAuvdE4yyrD0Jq6fx3Kaao909llyXfHJ6im4z0ctXbg6EZkj/Sw4g0gYHUp5vB1m
         gu3iVNv0JIWHWGyS7ocpx7TrKwt+4CoCqwNyQk9i9dA64JBT8ySheflWReF8RVjYLNvW
         QUkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=SP8HnsZWl8Dn12bpr6oUyj+6a20Pikpos1VU09+oCq8=;
        b=LBog3LuTY7fgnxf9TQNPfC7Yb5Nj6bGzZHr560qaKky5IVNUcc5WIS8NZ7+nXarp9o
         PrqtAYk8ZwYyeb3v1q91RDEDlXMKpL8GUlNEdn2AORdCxMKgKqf+B2nznpkqEn+jxrfS
         /hZjr+WKx7Qt2Zdel4v9pi0vClwSg97ftZe/XDH8EAOXd8BhXd5ZPOCJt8/oraJ4/oiM
         rZAuKH0DcOUIv3MpJwCZSVO8MzVFW7tPi9AWBVUkAazevoLMWtpXo/0xg6Tqpc5faleD
         JbzrT2Y/0LyKFlOe3IISEuP9NmOpbyZu+geJQDx7bw8nAGFy/pJicnucZIVtbM8AbK4+
         TiUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SP8HnsZWl8Dn12bpr6oUyj+6a20Pikpos1VU09+oCq8=;
        b=gRrLp2GwqQvp4HCQtxgIxQpzZ82JA64au5xKGG/Cq+wGx9Xtyji6ojLFYgKXoZHwVS
         sgBoD4PkcXE2IeBtXvv5LRyj4TFcnmtgQ5+miC95PFyFnXoY/QytmvUEH28AJYtDvUrD
         zI/ztl1mAnjYrPgCzxykGs+Al88pMJarSQqmNTW3qb+uTFiOL70ncy0EuBuHwPGDshQn
         BN2DpX9DN8iePhP7iCJQkM2dQvJu6atEujh9fcmQlsRd+9Puw1N57qwLw1J15SRm324v
         /jaMRPo6PlgY9Xr75XG/kQoCSD/WvVoovoqdvao029hHkQrUeBBt76TMcFf6/BkWhsAT
         EYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SP8HnsZWl8Dn12bpr6oUyj+6a20Pikpos1VU09+oCq8=;
        b=MIS6hXRIDBkpPWgQLpOInocAMc1nn+CDOfCJZGWS74AxkoNa/T9smJQEibXPF+E2o9
         dasOKXvtiz51xcbtLahER4G9Ss5t3S8ckcilLQsRLsEUsOe6F4iXk6lOxFRhHsjpHiTm
         YgwlIJUfnT5wd5EVWi+ciRTFcjnEX7dCRhKZ6qifhUCv8GS5umg7cUEZrgicQXAeVW9x
         SknqJZXUoM8Gmwef6GDPf9GFMLqKWESjsbmBkBKeUC8GqOLBFJZQke6WqbEPsOf9HbFU
         dSAyDYULoVGHu1lTNJvbyGDVaDyJci3tBwhM0CD/6fK2aWI1ehkwv1tv1j6+p5E5G0lN
         1ktw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVGM0/9HtpvoA+fdxPR2gr/bF/9d/lvaS42vvI5mbMt8JARTdAW
	QiGf7E8ipmC+OY7v3j4KbKc=
X-Google-Smtp-Source: APXvYqxEsZIZpmq7MJpbA3a9umsXrUyBO6eT+YJiG/OdrAMPCf0EcPftbD/LvyIvAm+cx+cD597gNA==
X-Received: by 2002:a1c:740f:: with SMTP id p15mr6289026wmc.103.1561710572502;
        Fri, 28 Jun 2019 01:29:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls380620wri.14.gmail; Fri, 28 Jun
 2019 01:29:31 -0700 (PDT)
X-Received: by 2002:adf:f483:: with SMTP id l3mr7290510wro.256.1561710571872;
        Fri, 28 Jun 2019 01:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561710571; cv=none;
        d=google.com; s=arc-20160816;
        b=Rg1f9dYpMQx+lCQOVMd0H0nHg88dOzhAreFafTtrBZvlLOh+ewoKd6iJIn6/E+TOv9
         9n0o2dUHdJCumGo8ZzOCec5Uqq2PvD8Uxo6dKFSqMJI4PC0m/rD8nEW2WLispo5bQwBH
         lWaN9BDwl5CPxkGV9inNHwrYnU/U8aaO/2BY9Yhtn5CFbmSE6+HVtFe2e6MkD7IvR2Vq
         /xWyA8rWiM/a9/+pgubCNDa7AkdosiVoWf2TJOSMTrUphMq8a9ZWNBt++vsnd1AECSlr
         IfOcEQ2WxVmSVwzAfNSRjGl9gqsGyp9RlX9T2BXIScicT3gbtImChs5rmdTbyL8bhX12
         UPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=0FMjWAdtqcSfz5bHEyitypAmgMdQL8aYo+t2AYJmnto=;
        b=Cuak2H7Kkc03kn9ppDIhkWYF3c6URrERuF97iLwdlD1VMfz6+VtdVfmbVxQaqxNPdJ
         IAHZQdfL+luqfInKl20lAZBZsweT9ujsCw3mgbFpM/W8vyKCUAzs5GvPb2rOoa94n2ON
         qV5FaCgPbWZ7ZwCllDMFpYwCCh18c2x/zt4/O71NZE94bPh5phAF5h52HMf8d1KauHH3
         yezT/EZUfTm6jgutawNRbl/A9yT21kH3m8lTx2rXYsnxSGxt+y3AmbTyFfYPdKlwdqYE
         Dq3V0rl/XkN6LTY/aGZkvYlVuLW2oKEbvM1if7TVE8ox7OE3FU06H6bnKaos8xDmKwqA
         Bfbw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v3si115750wrg.3.2019.06.28.01.29.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 01:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5S8TVcM018407
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 10:29:31 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5S8TVkI024757;
	Fri, 28 Jun 2019 10:29:31 +0200
Date: Fri, 28 Jun 2019 10:29:29 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
Message-ID: <20190628102929.6e801007@md1za8fc.ad001.siemens.net>
In-Reply-To: <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
	<20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Hey Andrej,

this feature was already proposed and discussed before, but never
resulted in patches getting merged.

https://groups.google.com/d/topic/jailhouse-dev/BSfMKio91BQ/discussion

I did not look into it yet. But you might want to reread that thread,
making sure your proposal covers what was discussed back than.

The main issue really is that a lot of device drivers do not register
themselfs as port-users, so we can not detect them.
But those exotic ports are probably blocked in the default config so
there is no new problem. A new problem would be if the generated configs
shrink the default set, revoking access that was granted before.

But i agree that it is a good idea to improve the generated config to
reach a working out-of-the-box state.

Henning

Am Fri, 21 Jun 2019 00:06:14 +0200
schrieb Andrej Utz <andrej.utz@st.oth-regensburg.de>:

> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and
> override the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but
> eases manual configuration.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 150
> ++++++++++++++++++++++++++++++++++ tools/jailhouse-config-create |
> 26 ++---- tools/root-cell-config.c.tmpl |  31 ++++---
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
> +        PortRegion(0x60, 0x61, 'NMI', allowed=True,
> comments=["HACK!"]), # NMI status/control
> +        PortRegion(0x64, 0x64, 'NMI', allowed=True,
> comments=["HACK!"]), # ditto
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
> +                PortRegion(prev.aligned_stop() + 1,
> r.aligned_start() - 1, '')) +
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
> +    def __init__(self, start, stop, typestr, comments=None,
> allowed=False):
> +        self.start = start
> +        self.stop = stop
> +        self.typestr = typestr or ''
> +        self.comments = comments or []
> +        self.allowed = allowed
> +        self.neighbor = None
> +
> +    def __str__(self):
> +        # as in MemRegion this method is purely for C comment
> generation +
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
> +                sub = PortRegion(r.start, r.start + 7 - r.start % 8,
> r.typestr)
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
> diff --git a/tools/jailhouse-config-create
> b/tools/jailhouse-config-create index 55601a6d..d154ec44 100755
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
> @@ -269,7 +257,7 @@ product =
> [input_readline('/sys/class/dmi/id/sys_vendor', inmatemem =
> kmg_multiply_str(options.mem_inmates) hvmem = [0,
> kmg_multiply_str(options.mem_hv)] 
> -(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
> +(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
>  ourmem = parse_kernel_cmdline()
>  total = hvmem[1] + inmatemem
>  
> @@ -283,11 +271,11 @@ if vendor == 'GenuineIntel':
>                                                             dmar_regions)
>  else:
>      (iommu_units, extra_memregs) =
> sysfs_parser.parse_ivrs(pcidevices, ioapics) -regions += extra_memregs
> +mem_regions += extra_memregs
>  
>  # kernel does not have memmap region, pick one
>  if ourmem is None:
> -    ourmem = alloc_mem(regions, total)
> +    ourmem = alloc_mem(mem_regions, total)
>  elif (total > ourmem[1]):
>      raise RuntimeError('Your memmap reservation is too small you
> need >="' + hex(total) + '". Hint: your kernel cmd line needs '
> @@ -298,20 +286,20 @@ hvmem[0] = ourmem[0]
>  inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
>                                     ourmem[0] + hvmem[1] + inmatemem
> - 1, 'JAILHOUSE Inmate Memory')
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
> diff --git a/tools/root-cell-config.c.tmpl
> b/tools/root-cell-config.c.tmpl index b6ac8637..9f65a72a 100644
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
> -		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI
> status/control */
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
> +					'-1' if r.bits() == 0xff
> else \
> +					hex(r.bits()))}, ${
> +			('/* %s */' % str(r)) if not r.is_combined()
> else '\n' 
> +		}
> +		% endfor
>  	},
>  
> +
>  	.pci_devices = {
>  		% for d in pcidevices:
>  		/* ${str(d)} */

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190628102929.6e801007%40md1za8fc.ad001.siemens.net.
For more options, visit https://groups.google.com/d/optout.
