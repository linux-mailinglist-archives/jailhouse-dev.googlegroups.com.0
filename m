Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXZWTUQKGQEKZTA3BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C976A09F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jul 2019 04:56:12 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id i13sf1517819lfj.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jul 2019 19:56:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563245771; cv=pass;
        d=google.com; s=arc-20160816;
        b=buHYmtB4bm7H0gwXVTatqwdQFayM7Gcpm6FzkcRcjcjyh6kwVX9ljHk559xaUecA/2
         Hvh1yALnsuBYK8SsbUtuNGj0lgoXnG5gwVl2yN7IgjVlNPhmwkFr+aWmQf8OjmuFD4DU
         en9po5FrCDre/AkUyE1RwLLpDEwv7RaPEp4ZAVNyLRlyBB3YTK6ydpdGhDNsZSH/furV
         EXD15QVdphTgg6qb6FkAJ/EeW4pm3f4JxVzlulroorDcnRjQGB5OGKvB8ZKXLiQ2aFqy
         T8MYMuJG8XbGe3OwAiwabc0dBAgygYUXDgUGszApj/3GsJfjWUO1nVD35IVY2AuI3NB7
         rZfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=cawC2JxE5Q1QQl9aTaoZ8lwY6XHZGZHsuF4wUKj0AvU=;
        b=UUpcVEuFdMZADGEmPgyj0LZOnrkc0Xah2GqoLQ+XOc4Id65SSpb46ulPO+acVMKr8f
         aj3xuuF8o2R/y9TzqKuT+81TDp8l0RPOZA9dk2uUjppjT6tkMThGZ9NqIPG6bhqjKO0f
         c0X8CBzB20LnbOgo3b6D/qTvgTvv2QO60I2397aUJjU2babr6CjyeKGZNcCaXPjl0vMg
         SIYyknFZhHk7pSqn6WdK9234RAg1KQlYmd/WiCvC9eqd54qbfyDO7Zdlpus3oeFpuhSJ
         6PGiXHckiCVcGZbHf5RSqyV9O9wUWlTVpMpOw+g4XUirDKZIL1kxuUt26y/6qaO5D8je
         W1TA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cawC2JxE5Q1QQl9aTaoZ8lwY6XHZGZHsuF4wUKj0AvU=;
        b=mTCXN/nB7UcFfnkt5uS6J/j5eZXB1xxUdCw8qZtZ43w1BhGnqV9b/GGkqGAhhwdCsy
         wfhrNEyYakDu+i/YpVAB2Cy0oyCJK1a6F4e85mLKmPrXxypbtfMpifVoCLRERUpJ3CH8
         5BoYv20Adzmog0ifWDhZJ6nQT0j8us0zh4FGmq1U0+MUf0yEjLviC8Ft5kjnrlebK8Nk
         sbcXiATstUKkKi1c+q29qnCKxD09w7/4113Z0SiSPSlh7RI9TDQAR+bjvvFMVlkBjn/8
         191maGfqCCpRc8bdUuXYku5Wc9oLM0t+VYgHhOjjkz39WMLg0mAIVvdUl4MuunaPkfwv
         EAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cawC2JxE5Q1QQl9aTaoZ8lwY6XHZGZHsuF4wUKj0AvU=;
        b=b2814B33cgx8yGxIA2NjN5+1A9bXNxNSczdpaATY81sscZQi2EEOxbmeQnBntvEZcq
         r3ypjMKF5x8xNCVoiBOzvWrhx3HEW//JBoglqL7fR07hcRAVqSvjUGhLt2PgnuVgZHMx
         aPnV+J+7RjdThJBTXybj4jZ/U4StSCgBc5gIqgXXyUBZ9xXPAN2w38MXp1Kue9Lz+BCK
         2lRMOi1mzGyLKeguNzo7aLs6zQARhd5aUfVzlGWkQ8T38XV43AOu/jeiYt7ynfDrbb5R
         38Xf4558YmY9Z/yDjwbMxsZWvervA6PpElxxmo8DMhjBdDiEQiELjRmgRUIiKGWXQszm
         iV2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGpmStKw9qu6FoYaNtQHjvd5l74sA4A8ecZi3qGW70sxlDXAre
	X3G+SvkCE57G+XX6ii2pQlQ=
X-Google-Smtp-Source: APXvYqzOXB+tGe+nZENEilt5xZTl0/XqyVWKeEybvvw5VbF9sm7B7HXFYZsyJDZ9pqCdr+ZokJTceg==
X-Received: by 2002:a05:6512:244:: with SMTP id b4mr13913206lfo.114.1563245771643;
        Mon, 15 Jul 2019 19:56:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8854:: with SMTP id z20ls2182583ljj.5.gmail; Mon, 15 Jul
 2019 19:56:10 -0700 (PDT)
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr897935lja.114.1563245770362;
        Mon, 15 Jul 2019 19:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563245770; cv=none;
        d=google.com; s=arc-20160816;
        b=xH0UALhWA1n7kDDVkWAwsbEVtgHQbhh2zIgeQszmWonSQFeM0OdhQu0ChCW3Fgg6Jz
         aqVkV5kab+OPbDnvwQh5A+14XKYfreVuMMQckQkz5r1zS/XvGVql7k3PIWftO+KZwYEk
         VFkHa0mbyeEe6biuSWzLS1PSPEEYgzJBF5/jlnR788x0iu0CnZpJQTFAQELv0he++12n
         s5oVZPk6hpn2h4M2zhMAtnEbGDRyUfzyIK+OSyO26wElo2sxltbhT6WkO+XycZRHTklc
         ZNODpQFLXNsXvNq84dTmTT4Dzh/tqdUCQD8GVLsRcE/ZD7jRpc5ulRco42M/1qZFqqup
         sAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9rkcJb+Wk5xHfXF5CVO4QAJ+ZW5FrtBiZXxSrPDwqT4=;
        b=0ijKJmLp5QKrnYxbCIV9pTbY99dt7iN2s0hat/iGaBsP/0gcTL4snDujbgetnZj5Mw
         j1o2jqGpq1mov1ECfeiAEsVIjxjsNDZMIp8zaUMq9TZjO1BC15PEZjt7ECXnBoU4nHhz
         jVd01IEd0kcXyglCMghb+sDGx0UA1PM2MTV8NqA5F8Mwr2wU4hJRethN1ilZqIlIhXV6
         dp2KQ6avBnUX9Nu88Cv+uMymMM9x+rArdRKyGa2c9qyOvC/bKCTyINkEQldLKOJlKT0x
         TEGpPQaUFAQPVDylJ0A/qIJAz1GKZx/uSdHhz7I4s2tMKzeGGd6T5p4r7BEPEf+0RHdF
         2Azw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h11si1157599lja.0.2019.07.15.19.56.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 19:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6G2u9w9015708
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2019 04:56:09 +0200
Received: from [167.87.233.106] ([167.87.233.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6G2u72Q010186;
	Tue, 16 Jul 2019 04:56:08 +0200
Subject: Re: [PATCH] pyjailhouse: sysfs_parser: Add more precise length of
 some extended caps
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190711200915.21217-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <27ea7213-d87b-5524-e1e5-bc07c8149f6f@siemens.com>
Date: Tue, 16 Jul 2019 11:56:06 +0900
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190711200915.21217-1-ralf.ramsauer@oth-regensburg.de>
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

On 11.07.19 22:09, Ralf Ramsauer wrote:
> I often run into situations where Linux tries to write to some extended
> capabilities. E.g., Linux wants to clear Advanced Error Reporting (ERR)
> registers when probing for a device.
> 
> At the moment, the crash dump of the cell is hard to interprete, as it
> remains unclear if the access is inside a capability, or if the device
> just accesses some PCI config space (e.g., accesses beyond PCI spec). At
> the moment, all extended capabilities have a fixed length of 4, which
> supports the confusion. Four bytes only cover the header of the
> capability.
> 
> This patch calculates the correct length of PCI caps for the
> configuration file -- at least of some capabilities. For some extended
> caps this is pretty easy, as they have a fixed length.
>   Nevertheless, other vary in their length. In some cases, it's pretty
> easy (VNDR, ACS), in other cases it's not worth it (VC, VC9) due to
> their complexity.
> 
> Caps that aren't handle still result in a length of 4.
> 
> Additionally, switch to a hexadecimal representation of the length of
> PCI caps in config files.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py   | 35 +++++++++++++++++++++++++++++++----
>  tools/root-cell-config.c.tmpl |  2 +-
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 0a690186..a21690db 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -655,14 +655,41 @@ class PCICapability:
>  
>                  id = PCI_EXT_CAP_ID(id)
>                  next = version_next >> 4
> -                if id == PCI_EXT_CAP_ID.SRIOV:
> +                # access side effects still need to be analyzed
> +                flags = PCICapability.RD
> +
> +                if id == PCI_EXT_CAP_ID.VNDR:
> +                    (vsec_len,) = struct.unpack('<I', f.read(4))
> +                    len = 4 + (vsec_len >> 20)
> +                elif id == PCI_EXT_CAP_ID.ACS:
> +                    len = 8
> +                    vector_size = 0
> +
> +                    (acs_cap, acs_ctrl) = struct.unpack('<HH', f.read(4))
> +                    if acs_cap & (1 << 5) and acs_ctrl & (1 << 5):
> +                        vector_bits = acs_cap >> 8
> +                        if vector_bits == 0:
> +                            vector_bits = 256
> +                        vector_bytes = int((vector_bits + 31) / (8 * 4))
> +                        len += vector_bytes
> +                elif id in [PCI_EXT_CAP_ID.VC, PCI_EXT_CAP_ID.VC9]:
> +                    # parsing is too complex, but we have at least 4 DWORDS
> +                    len = 4 * 4
> +                elif id == PCI_EXT_CAP_ID.MFVC:
> +                    len = 4
> +                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI, PCI_EXT_CAP_ID.PASID]:
> +                    len = 8
> +                elif id in [PCI_EXT_CAP_ID.DSN, PCI_EXT_CAP_ID.PTM]:
> +                    len = 12
> +                elif id in [PCI_EXT_CAP_ID.PWR, PCI_EXT_CAP_ID.SECPCI]:
> +                    len = 16
> +                elif id == PCI_EXT_CAP_ID.MCAST:
> +                    len = 48
> +                elif id in [PCI_EXT_CAP_ID.SRIOV, PCI_EXT_CAP_ID.ERR]:
>                      len = 64
> -                    # access side effects still need to be analyzed
> -                    flags = PCICapability.RD
>                  else:
>                      # unknown/unhandled cap, mark its existence
>                      len = 4
> -                    flags = PCICapability.RD
>                  f.seek(cap + 4)
>                  content = f.read(len - 4)
>                  caps.append(PCICapability(id, True, cap, len, flags, content,
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index 81d3a92b..512b9f0d 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -199,7 +199,7 @@ struct {
>  		{
>  			.id = ${c.gen_id_str()},
>  			.start = ${hex(c.start)},
> -			.len = ${c.len},
> +			.len = ${hex(c.len)},
>  			.flags = ${c.flags},
>  		},
>  		% endfor
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/27ea7213-d87b-5524-e1e5-bc07c8149f6f%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
