Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDFC5DTQKGQEB5MVXEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F5384E1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 09:23:56 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b14sf556748wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 00:23:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559892236; cv=pass;
        d=google.com; s=arc-20160816;
        b=ISrqXk+ZEdPeoeGotHbz9gX9j9OdUroovdhr0q6O4sipO53R9R9aO7/DanfyHAYlDb
         F0H4H8+UcXUXOOJHNrd7+jaYFLe12Bx4Hf+tqFaTAAT7OP6t3x2kmIef3kcZujU3bpoa
         WwIlTHt4+4LNsyGk2c4VLVl1AKCvU8kRWSi0Uc+yr3gfqUATIKAwdsqwE+MGDw9oNo+f
         hnfj27PSy5NLzkCC6gfowlxfvbCrn72HbW0kb/vlorSgDxshBt8rWjGtkowrEoaYC+Sj
         WDZoimEp2dVVMgFz01DztQuIONvdEl/MEJebv4UOTwrEWq6V1dGPpfD+60ddsHJDCSZq
         cT3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=0+DQ4gaNUWLEVwmAclHU5Gl80sHjNH3lincRx9IlZOc=;
        b=LSKLoVuAwXiTCzrrlGxaA//JVrWo6etXJ5Ah11cpFQveO+HdNqOgEsGVFKp1Oz9+ay
         1Vdmvtahf9KQFBe2bBhEEryBk6d8yh9xJ09UyeSFAEhGwl9UV4+hW0XcUXj3vsFeXS/4
         7OiGCSKWFoNWVY9kh0b4gc4EP59ZTU/iejUtE5CC6pZudSgF9jsN2o1pkOytSVMsHIF8
         I5gm9HKns0Di1osGMJmVoPwXEpENiLlpzxUT8IWwTYsU1b7h+7JudqXBA5fdNJR8B566
         WBGbAU+6mJUeFCA3WE4AglDXao/SNuJEZOG8PCrx7tv0xfq8tLP8QtR3I65Sjg8TO/Oj
         Wqqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0+DQ4gaNUWLEVwmAclHU5Gl80sHjNH3lincRx9IlZOc=;
        b=EEV6YYidCW6ZUxBUBL6jm82V01Kq2e7QxuH2EwfR0ELl+bxuqJm895BKv9Z8Y07F6h
         5lPWC09D9HU1o/OSCzhJ0VVnQWaQTvCvJDJy8956FLeUrEbB+C+nSJtv38EsfmY7b0wn
         /ig4XoPVU8nhCEXvMgjpj6He0z1LKmDklxeRLd3CPksns0I7l5upgLm9+pEpZymTQhoz
         JX88C04+2GLkNcm3pSu8gJIdrvmto8WvXcLDgSfEI13880GX+7/3mhd1VyYtXXoPnHMj
         MiimDR8HCIJuvUNSRqKyoph3m6YTy/TEkVi+tDgroXFAjqBySp5v1BKDr9ojsYPqU2Na
         moew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0+DQ4gaNUWLEVwmAclHU5Gl80sHjNH3lincRx9IlZOc=;
        b=bmP52G94X3hPff3rwmndz42KM5hRg4r4VHkBMeW9nVUE/HQCdF6Bgt53Wf1+i2qodw
         TYreSlS7jTQIl3aK8CVxWk04SxkDvGcj9HdpvKfoqG1tIIJ3oT1HsxichlCiudOXea2a
         PrdIf6X9XorhousiBSD4cjg/Sl5JFhMtaUfzobEM+5y6cHmUdE6UbCNi8BPYCaDAWlNF
         SQmu52jckZyahDncQrnRuxAKuJtn/yMUYQ1vh1YLWvh/EIzGK3W9I5CnYSNxso4JP3YF
         6eGJFJLE29L/W7H0ajM468HW/t+zVXfYnDvbF9F8OU4KGlyJMQQ5C8knJIy1haT4lm7i
         wVMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXy7MF55+roIAeEv0D5jsH7KCaJARFIoQ7op8k4BU0N8niRD2MD
	FQnZJ4Wj1k9wIU0LL+CJjcY=
X-Google-Smtp-Source: APXvYqxMrb8+eyNkXcQVRUYl+kqPRc5C/CfOhYjf/8zTiPIwLLT8MvunVg3lP1S6oUeAtTtLkLJrEg==
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr14051425wrn.160.1559892236397;
        Fri, 07 Jun 2019 00:23:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ef4e:: with SMTP id c14ls1817984wrp.5.gmail; Fri, 07 Jun
 2019 00:23:55 -0700 (PDT)
X-Received: by 2002:adf:c614:: with SMTP id n20mr19733609wrg.17.1559892235073;
        Fri, 07 Jun 2019 00:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559892235; cv=none;
        d=google.com; s=arc-20160816;
        b=LPTw3f4owRJSTrDA1MNhJHuVQ0a41RQQFiCHHzlzYZStvSfPGxl/Kqgaqfag8VsPh6
         eVXjgOIuEORc55ET/4x6AZvcZ3BwMuCNMaoOURZvmosk0wqTnXD59qEC1GuMGPZ0NJPX
         729uFpZn2PYpSMnt3Tr+ANgMjD5AvwfuDRY3sC3la1NzVph6O8zK2i2mFVGuGeUJQ7y5
         OELodwTIW2fOBPw3qwrcTy7Z8Of/Ygzz5jrI17N9Igf2PCbgZBDXw76iHdQIFdNPvWbi
         y9pb28yu6pGxW14+87Ordpd4+QBCTBsVUfKhivyh2nmrjF243co3nQhh67feYd5jekFV
         B+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=fqGzzpuGi6Zr7mcwJTvKMwMdr0jdvC8YBCoMBOAV7BA=;
        b=Ksdy8jSlRYj4tq40lcsGGe9hYEdKmuKya+JxLTf5ZjCc4swMgyRG1jxFQz4N9u0HJx
         gY9xPD8KcqNWdUmhsFgL9/OjypXpVS0M+TyzxMv7m8SL2y8KX+kUUHLLunjeFxPHwDqB
         kaipvAYo/DmRGZ90PJt/Hgk5EU+dgkZjvOuJu4I3vv6nbbpq0exBsFxYLhL1gIASqAjs
         WgQdCou9tQ/R+oH6o32aEpu8gvNpZhxNNI3dB+kFCRqj0Hm9V2okWoDeFZP46pNwDeoQ
         UH8rG5+5lYGe/2PM1E+23T3nkqIvRzIdnxOAUDeRz4IZ4lB+8wOgxLbNhGSWWW0p5txE
         34FQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f83si41702wme.2.2019.06.07.00.23.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x577Nsfh032345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 09:23:54 +0200
Received: from [139.22.112.121] ([139.22.112.121])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x577Nkjl023457;
	Fri, 7 Jun 2019 09:23:47 +0200
Subject: Re: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
 <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
Date: Fri, 7 Jun 2019 09:23:42 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.06.19 18:17, Andrej Utz wrote:
> This replaces the old static port list with actual port regions from
> '/proc/ioports'. The static regions from said list are kept and override
> the data in case of region overlap to retain compability.
> The generated port list is virtually identicall to the old one but eases
> manual configuration.

IOW, the whole PCI IO space remains accessible, is now just partitioned in order 
to ease manual disabling? I wonder if we could not go one step further and only 
allow known regions.

> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py   | 135 ++++++++++++++++++++++++++++++++++
>   tools/jailhouse-config-create |  14 +---
>   tools/root-cell-config.c.tmpl |  15 ++--
>   3 files changed, 142 insertions(+), 22 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 56265fb5..d06a476a 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
>       return ret, dmar_regions
>   
>   
> +def parse_ioports():
> +    regions = IOMapTree.parse_ioports_tree(
> +        IOMapTree.parse_iomap_file('/proc/ioports', PortRegion))
> +
> +    tmp = [
> +        # static regions
> +        PortRegion(0x0, 0x3f, ''),
> +        PortRegion(0x40, 0x43, 'PIT', allowed=True),
> +        PortRegion(0x60, 0x61, 'NMI', allowed=True), # NMI status/control

We should preserve the property "hack" for this one, and that ideally as comment 
in the generated config. Could you enhance this in that direction? Benefit: you 
could add the originating device as comment to other port ranges.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1facd54e-88f5-b3c0-91e9-85a2aa821245%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
