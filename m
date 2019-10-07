Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWGB5XWAKGQEM2WU6UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id B4860CE884
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 17:59:20 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id v17sf7332416wru.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 08:59:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570463960; cv=pass;
        d=google.com; s=arc-20160816;
        b=Od62iT2yhSL+5VzHuYpR2UI0BOxabtho5ABZNCc3QtYiODqGecFulvMn06GrzQ7BsS
         vASlwkrkFI1UuWwGms7xA+YcHz1O5cRzVBgzlZZe//bJQlkSyBP3WR5VEOJUlL6OT+tD
         TygWvSVTA+u8/+6cifw1/n0Pn+8dXWMcfwFK92Xr3tJ4z/zShvuXRU10B7vRppdzbu3G
         +j+ZE+RtY6yZ5+66rPTHjI07SxPuVSf74s3BR1v40guabY2IZ6Hl1XSUnb4Y8FLgX3tk
         91v0twQOtfFA3kqnrEvdBTy0DvcMVY9Lg3+p4xtd/uoYRubdrG45e6lvurfUFaYMnoxr
         mMFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=cyRCFWujXuF9gXoUJDyS3GsuL87A40hVWUXDvvDPwSQ=;
        b=Wkyg1hgqhXb9kLut2r7Mh0Ac0SmIZAh3FJ79CoJq2VOmWSMKJe3e9UCkJ5xpVwHSut
         U83jtE087sIaSXG3jSZuzPrO9MXyUtTDUmAEU4elLLu26+ryXcPdTKCloLtKQ1gqgwpc
         HMzLY1mYOeH5vpKx/hZbAdPuBki3nlTBsdtJZVCrRxYhQNHW/ZkIE9Q8EoFkJS/Nm4ot
         ExMhPfS0bG7XcJgGsST/+5zzrq9Ev5pGxb/HeymBzWyEQJavC1tsYWoquVfAE5p4JpH7
         6f9vrAXaLS2Tjy7KGfo8ACeaN9zpLidLzkHVcTVbdHWA5PLxONbUtLwjzlkFPyUEiVCM
         GHoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cyRCFWujXuF9gXoUJDyS3GsuL87A40hVWUXDvvDPwSQ=;
        b=NcYKxr/xKlTo/bxwv1lpRxrVqEcIKDe+ZMRnB8BczK9t5PpmDxOKjxQdgBKGjx6JAb
         o3vd/11ownR05ciSJa6JyohoXR3JXfEN30vFkQVagVcP2oFMUv3Z7AXA4x4Muxmlei7m
         W1uuxdCAU+XXYkuqM46jmDtS9HmAHdqnXwMHQdfWARG1eLH/2cfubFpnnId8nAkFTXAu
         Kkjmjmo7x+7xBB1keOZPxg9md5HI2FylcMU8asdrn3rtodpr/N22N6Sjc9V5JG8Q1dgI
         Xpm+WW/acL+IOwiroIRIs1w0DqYxwo86hgY8gcSqWgAbE8IadWKZN31/1P4sDs/QMqVt
         mxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cyRCFWujXuF9gXoUJDyS3GsuL87A40hVWUXDvvDPwSQ=;
        b=IfalPW1WHFNzJkLu+4p57rzKxIem/lNq6i3+J4BRsyJuKBTnaku73ikvXNFb/SbOk9
         h9Meqkt0aUDe+4vddlQsSbHPupbvnkJc1cMVedejzAejrsxJisJdvycqlp/k3p5WL2Vu
         exCqBoQndKw/pv98iETqKEbE+bGVwtij81WsZ/1SSsjAp97TfBnh0aiat2QpZcl6qU1D
         ZcbjR+5jg7IDL00xEyAcn53HygM9X5/jpOiUor3Wt5raZrKQCdxHpmZO9iRgGD8LVS3A
         iN/+jzOjLYE37weFAxQKLQduR/UUmIcqu9ufg/WqX+HtW9MYNs94YnIQCfORMeTUKGeH
         LETQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWR5zqCgxq4huqua31z04iiw1B32lpdhVd1e5zsKHowc2gF1cu+
	kAf6N7QFuhezXbANygyvYO8=
X-Google-Smtp-Source: APXvYqzKx3dTS1Az3LpkHTKxjhIkav9f0V1pZoXbZmrSNS3YVMHXMgUeLaBTsP9KQgL2k4S2ljpr3g==
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr23812235wrq.141.1570463960375;
        Mon, 07 Oct 2019 08:59:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c5c4:: with SMTP id n4ls87068wmk.3.canary-gmail; Mon, 07
 Oct 2019 08:59:19 -0700 (PDT)
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr22533978wmc.113.1570463959861;
        Mon, 07 Oct 2019 08:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570463959; cv=none;
        d=google.com; s=arc-20160816;
        b=HZPLrqTvk+FbVzRfqTX/grGEtTToqSU1EDW+G4wAySRT50vSsI01fI7XgeXWS2z508
         guHbdKEjhO+BwSFOXRayjy14rFaVR1sYjxGIZi4CuU5YcrheIUErQwVLAwvlYmFxoWM0
         PDBrPczlPbrudw2kWlk7QbLgYPifCslwacE2Yp4RmYzjpP0U/WF5yibCSnlX6kJp+n8r
         Sc5dnXUr+TX1NHY0AAKZArKuS0NdrO9WB12WI0uUMJ2Ub1SehYTHw3yQPm1ik1KlJItX
         BfgQ78OAstOnmV/B1FSdbRWI2W/heEuvj4tN2a64vhmhmDfNTAQ0ENgCPO6IqQk5ZqOL
         S/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=3Pjsfi8xwMe7Hw/jhO7OJyMfjvxpj6jNQ4LndJPMQkU=;
        b=deg0WaZniOmaQV51Mqdz6CtCa986d0Rv2Y0r14/FadAYnWfl2930tjkZOgkiTwsrCO
         +mhiGcBI6RU+BuIYFkQxYn7yLCiJNrOCa+mCgKNXi6bxRSK3HHppS0UkJG/eZzlbA7jo
         x5yucsIOPzLXPOqnATkpjMIqm+q9lwNf4HgO8oNHOiHG0WSaWZVx9PQmST58mewIAaqZ
         ZYmvbR3JaytH1VAs4zfC4g/Fd/4Z9SqJ4Hzt4VhTlDj3u1KtvKX3Db9js5961veicEV0
         XupUmnCptmsJ9zCcsp4+yNsbXTZGOhoB3aMu64YfhEbarJON/7gGcObVH8Rh6m57MUHM
         PPBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id r1si768441wrn.2.2019.10.07.08.59.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 08:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x97FxJnl012865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 17:59:19 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97FxJTs029757;
	Mon, 7 Oct 2019 17:59:19 +0200
Subject: Re: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic
 fixups
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
Date: Mon, 7 Oct 2019 17:59:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
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
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> The sysfs_parser is written in python and not in C. We can save some
> parentheses.
> 
> No functional change.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index f65eacc8..464b6a80 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -125,7 +125,7 @@ def parse_iomem(pcidevices):
>                  append_r = False
>                  break
>          # filter out the ROMs
> -        if (r.start >= rom_region.start and r.stop <= rom_region.stop):
> +        if r.start >= rom_region.start and r.stop <= rom_region.stop:
>              add_rom_region = True
>              append_r = False
>          # filter out and save DMAR regions
> @@ -141,7 +141,7 @@ def parse_iomem(pcidevices):
>  
>      # newer Linux kernels will report the first page as reserved
>      # it is needed for CPU init so include it anyways
> -    if (ret[0].typestr == 'System RAM' and ret[0].start == 0x1000):
> +    if ret[0].typestr == 'System RAM' and ret[0].start == 0x1000:
>          ret[0].start = 0
>  
>      return ret, dmar_regions
> @@ -835,7 +835,7 @@ class IOMemRegionTree:
>          kernel = [x for x in self.children if
>                    x.region.typestr.startswith('Kernel ')]
>  
> -        if (len(kernel) == 0):
> +        if len(kernel) == 0:
>              return [self.region]
>  
>          r = self.region
> @@ -846,20 +846,20 @@ class IOMemRegionTree:
>  
>          # align this for 16M, but only if we have enough space
>          kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
> -        if (kernel_stop > r.stop):
> +        if kernel_stop > r.stop:
>              kernel_stop = r.stop
>  
>          before_kernel = None
>          after_kernel = None
>  
>          # before Kernel if any
> -        if (r.start < kernel_start):
> +        if r.start < kernel_start:
>              before_kernel = MemRegion(r.start, kernel_start - 1, s)
>  
>          kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
>  
>          # after Kernel if any
> -        if (r.stop > kernel_stop):
> +        if r.stop > kernel_stop:
>              after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
>  
>          return [before_kernel, kernel_region, after_kernel]
> @@ -907,11 +907,11 @@ class IOMemRegionTree:
>              r = tree.region
>              s = r.typestr
>  
> -            if (s.find(name) >= 0):
> +            if s.find(name) >= 0:
>                  regions.append(r)
>  
>              # if the tree continues recurse further down ...
> -            if (len(tree.children) > 0):
> +            if len(tree.children) > 0:
>                  regions.extend(
>                      IOMemRegionTree.find_regions_by_name(tree, name))
>  
> @@ -934,15 +934,12 @@ class IOMemRegionTree:
>                  regions.extend(tree.regions_split_by_kernel())
>                  continue
>  
> -            # blacklisted on all levels
> -            if (
> -                (s.find('PCI MMCONFIG') >= 0) or
> -                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
> -            ):
> +            # blacklisted on all levels, covers both APIC and IOAPIC
> +            if (s.find('PCI MMCONFIG') >= 0) or (s.find('APIC') >= 0):

Why are you keeping the inner brackets here?

>                  continue
>  
>              # generally blacklisted, with a few exceptions
> -            if (s.lower() == 'reserved'):
> +            if s.lower() == 'reserved':
>                  regions.extend(
>                      IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
>                  dmar_regions.extend(
> @@ -950,8 +947,8 @@ class IOMemRegionTree:
>                  continue
>  
>              # if the tree continues recurse further down ...
> -            if (len(tree.children) > 0):
> -                (temp_regions, temp_dmar_regions) = \
> +            if len(tree.children) > 0:
> +                temp_regions, temp_dmar_regions = \
>                      IOMemRegionTree.parse_iomem_tree(tree)
>                  regions.extend(temp_regions)
>                  dmar_regions.extend(temp_dmar_regions)
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/606abee9-5e5a-8add-062c-7a00833de34a%40siemens.com.
