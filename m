Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBWWM67WAKGQEHSCEYHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id BE928D1098
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Oct 2019 15:53:31 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id b6sf1166807wrw.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Oct 2019 06:53:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570629211; cv=pass;
        d=google.com; s=arc-20160816;
        b=M4x7x/XTmRnZQeWU9cu66nNwJ8zkYERT07fHZ/Oe6nj41qw0ECL9oXHheOfduwjbL0
         ry/z9o5PzZfvRH/GpFn8GRsxbJPdYD58qZeVAIJq/OcRWTYOYl0s1VGfjVB4lvw7xVm/
         PeVMCTZdz91058hjs6i1cHiucSznuWiEBJ+IHJr8NAjFkHOtODtVJn7HQKss302DPn2E
         22y7fdDb+i3iJMv2ENA76a4vrmNUcVI5m/tSaB7VK+Bh3Fk+VwEl2h5m4wzrv3AnOteo
         fEb5VAwHinKat5gs0f271EWo1JLRRJfSga7ojJDlKq3J/ioqBaVXuDvSWrhaeS4HZQ0p
         +JAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:from
         :references:to:sender:dkim-signature;
        bh=B6+7Av911iMZbIxwIG7gbeOveoKT8jy6mjGfl3LFJ+w=;
        b=vWU2JjLtsVjfY38mAH4igIMJjrEPwDfeSA8b2zDflkX+3UK97mr5TRRLwidC3cMGas
         Z5RpJ0giCfLahPtDtALSNAkdibO8Si9Mp5qNa3w/xMu96RfgeTK/UQJSn6CfOS6aCu14
         mzP+z4l+1S3AQyTRTWWs65w4RAnWIUrL7z7yvq+z4hVo2JBB/pYwXgsfQmzJyt/pog4p
         J9yTV7d7q3z39Olr6RqMO7KlLV/KW3G92UckoWtTNWFCwnF60jnThScLd4PgwHKF61XD
         PyJaC4l6/H8iAWZOTtFHmbrsLvQErGHoXXOcLZbRx4SxXqoWX/OL3/EZxkwtKeiIBRVx
         5Ofw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=r2eZDBRM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B6+7Av911iMZbIxwIG7gbeOveoKT8jy6mjGfl3LFJ+w=;
        b=iwck1BgWiB/Cir9KsuTSI3wRSEnqpbvRE628FBQ8hVGIkYBa1ebzdSMlj0+yubrCyV
         nbUp5RvGsm3EolozzM2MZFJ9bRdzA/bG/uWnkkQTCVszU+fNUv+xxwwt6cFBn38UpNXg
         CuNSggTc0KGRteSbXQh5x5ic0sxccmy1W4Zr6dLFhl1q3nrZ1/Ul4D0r62KJHYLDZ4UP
         uZveYb+KCfp6six4pESsex0yCF50A+h4eEwEFgSBbu9DS6OpryL0U7G1L6HrDiARndIG
         Q0fxoAyvnhBb3yR5om3AXy2rVs87rwOVQYkFT05IAkCepPf3Plpqg3Kwn27GEBFadvG+
         rKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B6+7Av911iMZbIxwIG7gbeOveoKT8jy6mjGfl3LFJ+w=;
        b=c8jpomm76YGV5tA00kvKmNHVnl0WOIxBlQNqmMD4ryth8ORos+0wd4iNg4PIgV80NN
         OeuGZqmW/DafcDjGXH5fcHHf9S2lKAAQoZ6qP42iwsD2WTM0amOSC3aRY9gJEZr1W4GD
         CN02Ixgei/6pN1kQoBFzeIi72LFFdI5e4xfy6cJKD7qYah06wr8M4nX9iIXJr04xMfdJ
         hFm9E0OlpoPsatwLLruk8li3VTkfvZekuXwP72IyBHVrn7BsxT5a7WFCLC7tYuw6QqGn
         WRAgsgktb3VNs4qEmB0YFip1/QygB91vBwuFIHP19PhleNniK30XeX1OZxOus3kSD9X7
         7XUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAURd1xmvU68KvxLFByJrkjPob7OKWmP3NKNN/gz6ng8b26lwHIk
	qkhK//aKChrrT3BMyHCQANY=
X-Google-Smtp-Source: APXvYqzSUKb7W7f2/vlMd7PAvIV+SL2wdSyUXYBe7jw7x8BtlWoPvqdwSy3rQa3EiYssvEzJwXahNQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr2666210wmk.135.1570629211380;
        Wed, 09 Oct 2019 06:53:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c44e:: with SMTP id l14ls91500wmi.4.canary-gmail; Wed,
 09 Oct 2019 06:53:30 -0700 (PDT)
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr2966905wmj.52.1570629210591;
        Wed, 09 Oct 2019 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570629210; cv=none;
        d=google.com; s=arc-20160816;
        b=FQ+qKPbkwtVILuDo58Odc3ZnkB1VEqE+ZD3G1trKZu4RWMy+be4dnTZXogjkafLjA8
         1uAgWRwEd34zctnGq7BDA9Y2NrJy9yrUwKtQxDiVv67j/JhTr5C86CS4ncvCDWJMiCeQ
         1DgXVXuaFUGcPCgYFu7QeB0gLSKStQNALlycObadnvvrtlOpcVM3j9CBcv2aYMnMyFHl
         aepaIXe1XojJV/F3UvWyHxfh9ey7lVtU7RTyj/OPj2dHRYHw9WbrBWBHn/IjJlO7t1ww
         kY3VwM6FQM54Zp0+/FnvbcRpbe4xwwO3RXqvyryz3CzE12TMdSU2kqws8q/wRxxPO38M
         +ODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:to
         :dkim-signature;
        bh=eome4l4hSlAGqOpNrSmEga9JXlXh17lh4Kmna9iaSGk=;
        b=aGiXs0R2ak6vq2ep1tJBKUCLcSJIwQcuPTpRxK/s1tkhc9nE7fu2+pRfwKWyYGmm4s
         Y2IdpIAdMR+CejwRiiRq430rK7DPjglDWp7HVzGXDbiyD+NNpXd7GahHC/cVyeci/avM
         MBiVZiu1DB7qNjqYStKVgcchJTawLsRfSQ5gVIPi2NsbpeYYfIgxeSEANcrIV67D6XQx
         dj7VFZoQLEbenuEKl2w3Oa2/ZlGHjch7K2/5t7JRpu82xEgLDpxUq20K/1hGJsdmxZzN
         FrNZ1HSGIQJRmIhEqj/pukwV6gIvl5iX6N1QptB5ozshiQx3qzYWbd7Xc60UqZiINzIg
         RtaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=r2eZDBRM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id q137si421545wme.3.2019.10.09.06.53.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46pFzt1Bhzzy96
	for <jailhouse-dev@googlegroups.com>; Wed,  9 Oct 2019 15:53:30 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 9 Oct 2019
 15:53:29 +0200
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190930193953.3002-1-andrej.utz@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH v3 14/14] pyjailhouse: x86: implement pio_regions
 generator
Message-ID: <9a3b3075-d4ca-d3dd-d63d-69744ef515b1@oth-regensburg.de>
Date: Wed, 9 Oct 2019 15:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193953.3002-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=r2eZDBRM;
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

On 9/30/19 9:39 PM, Andrej Utz wrote:
> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and override
> the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but eases
> manual configuration.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 60 +++++++++++++++++++++++++++++++++++
>  tools/jailhouse-config-create | 15 ++-------
>  tools/root-cell-config.c.tmpl | 11 +++----
>  3 files changed, 66 insertions(+), 20 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 0dcc7475..baed6a40 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -147,6 +147,43 @@ def parse_iomem(pcidevices):
>      return ret, dmar_regions
>  
>  
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
> +    static_regions = [PortRegion(0xd00, 0xffff, 'HACK: PCI bus', True),
> +                      PortRegion(0x3b0, 0x3df, 'VGA', True)]
> +
> +    leaves += static_regions
> +
> +    permitted = [
> +        0x40,   # PIT
> +        0x60,   # keyboard
> +        0x61,   # HACK: NMI status/control
> +        0x64,   # I8042
> +        0x70,   # RTC
> +        0x3b0,  # VGA
> +    ]
> +
> +    for r in leaves:
> +        if r.start in permitted:
> +            r.permit = True
> +
> +    leaves.sort(key=lambda r: r.start)
> +
> +    return leaves, pm_timer_base
> +
> +
>  def parse_pcidevices():
>      int_src_cnt = 0
>      devices = []
> @@ -829,6 +866,18 @@ class MemRegion(IORegion):
>          return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
>  
>  
> +class PortRegion(IORegion):
> +    def __init__(self, start, stop, typestr, permit=False):
> +        super(PortRegion, self).__init__(start, stop, typestr)
> +        self.permit = permit
> +
> +    def __str__(self):
> +        return self.typestr
> +
> +    def size(self):
> +        return super(PortRegion, self).size() + 1
> +
> +
>  class IOAPIC:
>      def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
>          self.id = id
> @@ -852,6 +901,17 @@ class IORegionTree:
>          self.parent = None
>          self.children = []
>  
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
>      # find specific regions in tree
>      def find_regions_by_name(self, name):
>          regions = []
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index cfa7fbad..e1888ea6 100755
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
> @@ -302,7 +290,7 @@ mem_regions.append(inmatereg)
>  
>  cpucount = count_cpus()
>  
> -pm_timer_base = parse_ioports()
> +port_regions, pm_timer_base = sysfs_parser.parse_ioports()
>  
>  debug_console = DebugConsole(options.console)
>  
> @@ -312,6 +300,7 @@ tmpl = Template(filename=os.path.join(options.template_dir,
>                                        'root-cell-config.c.tmpl'))
>  kwargs = {
>      'mem_regions': mem_regions,
> +    'port_regions': port_regions,
>      'ourmem': ourmem,
>      'argstr': ' '.join(sys.argv),
>      'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index d884089a..0afe7e86 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -47,7 +47,7 @@ struct {
>  	__u64 cpus[${int((cpucount + 63) / 64)}];
>  	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>  	struct jailhouse_irqchip irqchips[${len(irqchips)}];
> -	struct jailhouse_pio pio_regions[6];
> +	struct jailhouse_pio pio_regions[${len([1 for r in port_regions if r.permit])}];
>  	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
>  	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
>  } __attribute__((packed)) config = {
> @@ -154,12 +154,9 @@ struct {
>  	},
>  
>  	.pio_regions = {
> -		PIO_RANGE(0x40, 4), /* PIT */
> -		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
> -		PIO_RANGE(0x64, 1), /* I8042 */
> -		PIO_RANGE(0x70, 2), /* RTC */
> -		PIO_RANGE(0x3b0, 0x30), /* VGA */
> -		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
> +		% for r in port_regions:
> +		${'' if r.permit else '/* '}PIO_RANGE(${r.start_str()}, ${r.size_str()}), /* ${str(r)} */

I don't like this output format:
  /* PIO_RANGE(a,b), /* comment */

It's not just because my editor that yells about two successive opening
multi-line comments, it also looks a bit stuffed.

I will change this in the next revision to, e.g.:
  /* Port I/O: 0064-0064 : keyboard */
  PIO_RANGE(0x64, 0x1),

which basically uses the same format as MemRegions. The first line will
explain the range and type as comment (like MemRegion does), the second
line contains the actual code, that might be a comment in case it's not
permitted.

  Ralf


> +		% endfor
>  	},
>  
>  	.pci_devices = {
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9a3b3075-d4ca-d3dd-d63d-69744ef515b1%40oth-regensburg.de.
