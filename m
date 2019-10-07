Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6V75XWAKGQEQBZXWKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 08688CE865
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 17:55:39 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id o8sf15029wmc.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 08:55:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570463738; cv=pass;
        d=google.com; s=arc-20160816;
        b=P7VTgAceSJI1UUVwW+A+iwNKF6FezsY25dqWgl905lXzPh5OjWHzBG7hQkFWi2PY2L
         1z8bxT8A220Qd+8XImfBludigeUhk8Xl3byUzfadc48qGSrHafvIWUvqaSkilq7wngzP
         LT55T0Wr4g5XkwfpnQkOWSO8o8U6tYmMAARoaNOj0yrGqZkntm2DIZDVaB8FYXtOdLPp
         gU0L27b0ysmb1JPtXrB4VvbEqpySc9AqweMYUIoSahpf0+0lu71hGqCj4i6FLRfMwbwO
         mot+vIdVARIEcGkOTruyC5uzIL80DVqs+Jy0Fz9fpm+4KEkNtke42zh+1SOIHbUnKZDh
         UcSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=o5I0Sgw+2OaVo78PcMdNKHx5VhqODFlO5ou2KmR10y0=;
        b=l2MBM1IH83S5iDDJBGjYa9U+eNxSjKrTcUJGszAcbyLHKq6sGcLf8SDDu4Swn7eELi
         HBYaoxHn2ZNZrHk4q+RBQxs8WsGg0hjF5qpr/I8vDC72V0l4UMhHcDvksOJFFGHETSgs
         rJ4EIJ+KDHsTbsnQmfowRWcnbfybFuyaqJBGO3Dir0i/C0gm5QPbkRli7JLSLG4t3Mib
         UExuSfg4Xgu03EvCtn2jgBAwZCj5PV7Glxk6jHu5xH3TRjlpYcoRdhyTK0yn+JS628dt
         s+eucOX+Ug57Dvfzc25y1NhyDmtM5gABBGe3Qb6JR+994iQ90EOA8KOccanlXzCVZ+Up
         Ulcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o5I0Sgw+2OaVo78PcMdNKHx5VhqODFlO5ou2KmR10y0=;
        b=hTrQeLOgFlj7VE7jopLxkwmglyfbOwO8Hif0ud9Xv/3BcRCXE6xQmmQS8G0EX9Lbu7
         4lRJk6fotnKkV82K8T0+MRdOwoNNNe3ChI+tSIlNTjntwXHy5tdW7vVbF3bQW74vxZrU
         QT4WqhWC1gss6hIxlBYKoZzqs8YZqmvJ6nVsWYAIcqeYU/Q3S+9zSKrDlYKt1MTbBg2v
         +UW0hTzhiRw6pZec4+3IDo8tMVbB6ovsuN+NWQ879T3eO/aMCcjbofnJStO1UsJbNGZR
         xTUNb8X9ddH9iMxCO7kI+QlKHdpUdGesEree1ji+YyIC8GXdmzrWxrNOxb8MHbYSRZBu
         XTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o5I0Sgw+2OaVo78PcMdNKHx5VhqODFlO5ou2KmR10y0=;
        b=r9q3ohK6cNv4oF7hIkyp6ecqhfzrMiLHyjZdnTOVCxsBwcpozONtlzCqmTXsJ55aQ2
         LcSeCvuglGFtBAjpMD9TRf0JnsclUEIselNij3vT/E/P6NLYlHtoAy5aPPmwLSTrhCKU
         5hbyiaH/rJofhiRNBKfyqyICE+dP84dwMDRERhnk8Yh3Ofpu+ev6uxB1Qu7JOXuwhUku
         idTWWfMR+74pQs5Dxd13aJ6BMGBZZ5ErfG0zxzd3mQRN0xXDrMZ7P6o1f2cM6JiRIdiE
         M6H1DhUw64SKE0UulLJtEuAG4FgGNKxSkI4fqVUBMzdIUCt50M8E4wUHnmuwbVBMoquG
         DtHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6RLrP9VhAdNfw2edsS6ebt/AfzhIom6rHZawMH/vDgBzH7xb5
	Cxm8qM1EEd5ownxoL576O3s=
X-Google-Smtp-Source: APXvYqwuA4KnBe1s8RMWtYjx4/llun2BGS4badH1UA2hzR/wpr5GrWPCEcL9M3DGQWsE5gAct/emyQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr21226766wmk.49.1570463738610;
        Mon, 07 Oct 2019 08:55:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c5c4:: with SMTP id n4ls82138wmk.3.canary-gmail; Mon, 07
 Oct 2019 08:55:37 -0700 (PDT)
X-Received: by 2002:a05:600c:217:: with SMTP id 23mr4595wmi.76.1570463737878;
        Mon, 07 Oct 2019 08:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570463737; cv=none;
        d=google.com; s=arc-20160816;
        b=pNPoA6sCrRbbhwdycQkfDDgWHNtJC2IOIX9DbSahi+rg2eqs9fLuorwr/0/90gaDS/
         ZJBejKUBQxVkePK9RfwDaKMWZatUFspKydeh0wS+m5Y2iuDpL4lLErZ2KyvFmMgQNLNY
         LFrDUmz7TDOi8/AQXvfLkoW3i4QrO8+p8c0doXIunyeSVAdTwaZAL5HKFQ/AP3ESDZdu
         XG5yL4byVjtJ9G6ysemxNw6WGCgVp1nePv5+KjMyFzwnaEG2WPNe+oJE5xyGQr6DmXFw
         XaAdXhS+4abAFHGrZ3cYoyXUFIg1CcvZn+jQY1e++3Toj5snWcWX0PJmlOxCca+/Gnt2
         PSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=eHdhkseaBXHzVDuWNN4JofkS5Lc+eMBYWazfRMuzc3A=;
        b=eWho4YYMhXP1y3ulC45TuqkciMsx7L6VbDPhwN3p77Wh7tmWRBXv+IFaETcUJa8IbF
         3PqpNhKJ4yMA5Foz1JCJANPcpRY7+u6RjjD5WAvtpDPodPcvNfagiLKN8OdX9g5SjeRL
         jvP3kneP090fA89nBO0s1UNOszr07Ws9CDWQJTDLkEyscLYevyOXs+scrfC/aZG/X+iP
         pkEv//VqvozB75xnb5g2XqlAGLUttYGv2SU+h1QT50MqrVPBuq6+0IpRQOmzX0NWooyo
         UejVHeuqWxLSA1qFlj1JC7mOoScVwlfMUXLyVeO6NiUaWAOFJLKs79pJxTNmXiPUi/5i
         feLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id s65si108wme.2.2019.10.07.08.55.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 08:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x97FtbOW001982
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 17:55:37 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97FtbWa022384;
	Mon, 7 Oct 2019 17:55:37 +0200
Subject: Re: [PATCH v3 01/14] tools: jailhouse-config-create: Rename regions
 to mem_regions in preparation for port_regions
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <52f5e61e-3ff4-cf6d-c5b5-1f2fb90c8ec4@siemens.com>
Date: Mon, 7 Oct 2019 17:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 30.09.19 21:13, Andrej Utz wrote:
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  tools/jailhouse-config-create | 10 +++++-----
>  tools/root-cell-config.c.tmpl |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
> index 55601a6d..cfa7fbad 100755
> --- a/tools/jailhouse-config-create
> +++ b/tools/jailhouse-config-create
> @@ -269,7 +269,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
>  inmatemem = kmg_multiply_str(options.mem_inmates)
>  hvmem = [0, kmg_multiply_str(options.mem_hv)]
>  
> -(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
> +mem_regions, dmar_regions = sysfs_parser.parse_iomem(pcidevices)

For the sake of consistency: Let's leave the brackets. There is
apparently no semantical difference, but it is easier to spot that we
are unpacking a tuple here when its in brackets. I know we have some
cases remaining where it is missing, but those seem to be mostly in
tools/jailhouse-hardware-check.

>  ourmem = parse_kernel_cmdline()
>  total = hvmem[1] + inmatemem
>  
> @@ -283,11 +283,11 @@ if vendor == 'GenuineIntel':
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
> @@ -298,7 +298,7 @@ hvmem[0] = ourmem[0]
>  inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
>                                     ourmem[0] + hvmem[1] + inmatemem - 1,
>                                     'JAILHOUSE Inmate Memory')
> -regions.append(inmatereg)
> +mem_regions.append(inmatereg)
>  
>  cpucount = count_cpus()
>  
> @@ -311,7 +311,7 @@ f = open(options.file, 'w')
>  tmpl = Template(filename=os.path.join(options.template_dir,
>                                        'root-cell-config.c.tmpl'))
>  kwargs = {
> -    'regions': regions,
> +    'mem_regions': mem_regions,
>      'ourmem': ourmem,
>      'argstr': ' '.join(sys.argv),
>      'hvmem': hvmem,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index f9805dcd..b6522ce1 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -45,7 +45,7 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[${int((cpucount + 63) / 64)}];
> -	struct jailhouse_memory mem_regions[${len(regions)}];
> +	struct jailhouse_memory mem_regions[${len(mem_regions)}];
>  	struct jailhouse_irqchip irqchips[${len(irqchips)}];
>  	struct jailhouse_pio pio_regions[6];
>  	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
> @@ -126,7 +126,7 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		% for r in regions:
> +		% for r in mem_regions:
>  		/* ${str(r)} */
>  		% for c in r.comments:
>  		/* ${c} */
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/52f5e61e-3ff4-cf6d-c5b5-1f2fb90c8ec4%40siemens.com.
