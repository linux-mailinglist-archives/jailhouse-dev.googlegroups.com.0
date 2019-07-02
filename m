Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWGM5XUAKGQEBT7R3BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A05D142
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:12:40 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id 3sf3503978ljq.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:12:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562076760; cv=pass;
        d=google.com; s=arc-20160816;
        b=pbVmzYDQTzyhZiN09agXGTl0uz1oMfcyI5QAqQiTkGlRbUOCckMvrK22PSSE/VGQmI
         VeMOLdVCg1CJVnClCTmlwh4wlPR9p1A7NMUzrXOWeg+RdF9G7TOoe9uq0ZGADZnwmh/s
         KqTFPMk0lVzpd05234uOS5kkgebeso3niUlufqYnMwa+kq9Ma6/igqGkMCZj1cP1oLSx
         MATTPaftjd1A57wudKujuvBHMguTP4pcHpiB7wmjzGe9pr7ky/n8Y9I74nAtz9vVqpTL
         vZVFEWy4F38hfUBZNdzBQ1GpcEExLYfXEOwA8UZ/dR7P7aN1wephyPuJOe+OjmymWQ9h
         BN0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=hl5rFi8iyTIusa7dxfK1pwzCNJLN9crN3HdIg+pAdxg=;
        b=psmBJIMdnNCyXATq6ZPVw2gc5epaomBqutmnT01mTFDm0rnq6Dyr5H9/k7MN71CdKx
         ZJo0GtAsi3NRcaeclbxyuwsHhVH/DicQqPytmZpJhdB7OWetG2qVBPM3x/3W+tLQVSYC
         tvCPn2bJ+A1/dxsya5ab6HPz1emNySNct5/B9Z+N7jqYujBReQkLdjUhG3FP5U814Jxj
         2pa1wQ4yVKaDHFfk4ouUiEyA3uRxesescf/PJO7dTTFUqd8APgl5zUeIXrregXOBm8mq
         UB+5dxwt3CYrN9SeA6Gy0QHCwgH3XbnCtNeh/pR1FdBgulCW7DeteRRE7MAPVxqKXCIq
         jatA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hl5rFi8iyTIusa7dxfK1pwzCNJLN9crN3HdIg+pAdxg=;
        b=CTM8jLJtQiwpnH+8t4oF24DzuvbvEN03mAUQYS7HDsGxFQTDmcB0ZasebkaT3CHvHh
         uATgdTmiGs5+mJQhRt9Lqjr1Jnc8Z3kdK4gep9u1XMZqbkQzaIlvyhnm7LiIwm6JGV2z
         8UZhCb8bmAEuxpHSoNcKI/UkfCUpv9XjtnI4979tIdTADkif+c2rSncjHrHUxs0aJJxa
         53hIL8rrSCmcSGzu4Yj2K5N5m7/sK3PRIMZ+T4DmvxlH8B7ybpd2gHchvdqCBx1yt7iy
         iEcYTE16x6FD6my2XDKUXqeZqfqICdspdpNAxZ5K8jOqqFyicKjkLDzWHV57LoChZOvk
         k74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hl5rFi8iyTIusa7dxfK1pwzCNJLN9crN3HdIg+pAdxg=;
        b=aPIF88TudHchFUkxuKp+zptPmCN6SzsLzqKm7U1wAKrC/UbW3wxmoD0KSF6b2qafn6
         /JvDRvMUXdNPzCca7KCbt8T60Q7NbNJyEN68d2GdejV3CgsRep8XCyUFkjtzkTukc+5k
         kQOzJSVmO77rj9AsIZTOaUgySJg4NQV8ClpIBJDdX9FC2C+cqZKd+MqsDr+hlMP9rzaQ
         AlMY30WL7N6qgdGoRfHnKAYXyy0jqDwLVmxfR+TDlOouKdsOJiGmJ0hQ5nFm7lD/QpTP
         UUvgTGXOs+3AW86jfR5YGU9lidLaF3uWoKq7as6dibz/nwQ3D750HKrEPL+IBRsTqF/H
         qDRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWw8jiDeejEVu1J+ZIYeOCgRTcug/CA6qIDVoMkaKPNsKCWUFM3
	Rr2ddwkbZzyCeersJu84ys0=
X-Google-Smtp-Source: APXvYqw/OxEqEfL9FFEhHZSJe8gqV68CtFjQqpi4mJpqRRilwU/64uFrGDht0lt1B+RltSKOaar5pw==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr16914038lja.238.1562076760172;
        Tue, 02 Jul 2019 07:12:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5307:: with SMTP id c7ls556418lfh.7.gmail; Tue, 02 Jul
 2019 07:12:39 -0700 (PDT)
X-Received: by 2002:a19:5e4e:: with SMTP id z14mr12209206lfi.11.1562076759481;
        Tue, 02 Jul 2019 07:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562076759; cv=none;
        d=google.com; s=arc-20160816;
        b=HyMgyKO2AVi0fgFAg9RvZRrsB3kGat2fUf6E0RVi9Hpj+YHq6jrNqXClql/IELze8+
         j5PHQHfu8X400iTbyFj8Z5FU4LlKjNnwJOHqSg6IS4MTd7ehB5Up1kIXR5e+i9FsstDq
         vN4jGYoRRRjGbGoV3V8rtxd2MMlWGSJideWgfuy4l1KgswWXXxuDP/wWKDHgH/tbsUOC
         c6gL5lOrcAEwUiEthAxbnIIzwCBSIff8HGWHIyPpenXvNPOc3LTyRAzZaX1z4POKPxHZ
         LTOQNx87OTISPLAcTTwf+DpBnH5c5BzmjeT2HUvshPMAygaeM/gbHezDAmgSov2zvTjW
         NWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=PNTyeV/SykgPC5rFQitMbyCBHrQrOfyxIHKxPNjnsh0=;
        b=qZ93WzJ0OPxWknOkf+vyiA0K7W92LcRFUK8FjZuhkHNZUUkXeSQ7tMVpBVY5OC52Df
         qyuipwGwOybdRuv4cI19F59NoD9qHnJ0uf8CeGIAIkJyJCNE458v3iGRZjqHRC+QgfQ2
         MoCWZvHIk2yBv+YDQIztzZzIE02y/Bhuh16HXLubSXbZdqNkJnzWLhLlqqGT0Q177GZe
         Y+XQSlxBLmKAI5GzCLk5/bbYo6duFhliHiVlzflb0irF+e5WJUd7DtimnBs4jjSU89tO
         0F9NYsev9qVlLvoEECrmn/ZCJBO+w5MByI9dAzN/HOZ8n0rPFsA5fqb6kMV9wYjg/Fw4
         APew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r27si28097ljn.3.2019.07.02.07.12.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62ECb5k013721
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 16:12:37 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62ECb4m002271;
	Tue, 2 Jul 2019 16:12:37 +0200
Subject: Re: [PATCH] pyjailhouse: sysfs_parser: Ignore empty PCI bus regions
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190702135846.20045-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6d75be0a-73ee-bd9c-2982-7e262f82b637@siemens.com>
Date: Tue, 2 Jul 2019 16:12:37 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190702135846.20045-1-andrej.utz@st.oth-regensburg.de>
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

On 02.07.19 15:58, Andrej Utz wrote:
> On some systems the config generator permissively maps huge chunks of
> PCI Bus MMIO space. This area needs to be intercepted by the hypervisor,
> as parts of ivshmem-net devices may be behind that area.
> 

Just the make the boundary conditions clearer: This mapping only happens when 
the PCI bus memory region has no device resources so far. If ivshmem then adds a 
region later on, we are doomed. But if there is device already, nothing was 
broken so far. Am I right?

> Hence, ignore such regions.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index f48f249f..4a06ccdc 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -105,6 +105,10 @@ def parse_iomem(pcidevices):
>   
>       ret = []
>       for r in regions:
> +        # filter empty PCI buses

"Filter PCI buses in order to avoid mapping empty ones that might require 
interception when becoming non-empty." Or so.

> +        if r.typestr.startswith('PCI Bus'):
> +            continue
> +
>           append_r = True
>           # filter the list for MSI-X pages
>           for d in pcidevices:
> 

Looks good.

Jan
-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d75be0a-73ee-bd9c-2982-7e262f82b637%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
