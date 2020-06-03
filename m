Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLUL373AKGQEGV35SWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CC1ED3B0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:45:51 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id dn27sf1338548edb.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:45:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199151; cv=pass;
        d=google.com; s=arc-20160816;
        b=ePbbyhTtlzPZcu8/1Mg1qxuLzNSrx1OHTfspOZATtzlQkZe/p8kzH1ZXIjfLREGWNG
         Phye33Lf7sSqTg3PTbVeTECmzv9ea3eBkqycwVui+xfrsUBePy4YDhkwQqd/PpQURBRp
         OmysMdpIZfz64b952B0hEsU3YC7ugCD1OkaaENFvkFek0iLKuG+aU72Lf6tFAau89uSU
         EFtCcJrqqSwgZm/+Vby7K8O9Y3SlVovkTZ9A9Bpj+P7KWer9W2P8Mqb4M6BDzVU5ZAHQ
         5NbU1/tIRVPsXRyNSWUMWT7rtVLq7l2iMPVEY/QI/8jgeTaSqPI2GWS5Ot4QZ0uiyols
         bqlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=AlBylpnUcgKuIWkRQaP/vacixB2dnEeB9LO4dsf+ZvI=;
        b=m9ke58E0sXemA1BBQdKMfUCHOUE5y6jZxfKY4zQpG2Wa06PFLLP+0r8mrgqOaxFDnE
         UnQ2ui8oFwUWblNqcys3JwXbaGpFNtXfzoy8WspdmhH4XDSQJoXn1Gt/a0+cq/8ZsuY4
         ufEzvwk1NJa4gis5aB2to3fGOw/tPqL2Le7cQ4GkqAAaQY5pCOYg7x2xd0Ku2w9x6yng
         AogjKasWpehU5UhK3zpPYmLKg5hnP/0HFpLOnY+a+P+bw4GJN+b64ZL35PMyep7Hr6TT
         BTHBK+55sqd4Vc/dHfuehIbFigk3NuLRWbbaM3M7/OuJYMRDQ+Gp7wZlrxQGRq2Rh6vd
         /WcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AlBylpnUcgKuIWkRQaP/vacixB2dnEeB9LO4dsf+ZvI=;
        b=g9t2BHlXPWkEs6Or3xSLTzbwdiHLucwlEuNMj7ds8LK0+Cwm65xZv1rUJZ4Y8gTspG
         f32unJiycIBkmQFOxL6xq2Y3bMnG9u7qLWZS44fHullvpvNqEbnShkfIWgGo+D2BTBrt
         rm+JgNYnSWTpaoK0Y/uyIFgcJRR/GUWoAEHUG4XXW42A1TVYVxtRlT1i9dVKWzLEvOqH
         nWpLg79g8luvk5XypQXZWIQMB0DHWHV3tTbvb4Bpzn3Os2D3TImKDQl3eaV6Um4yp5al
         2b4eZQUp/gNskzeLhAgOAmagkWYnqThQ2PTQsPgqexfBvHoXvJclgbLy2dw2ZEq1jwHA
         XoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AlBylpnUcgKuIWkRQaP/vacixB2dnEeB9LO4dsf+ZvI=;
        b=NJl+OYQzEMgadDNrD/+9MjZ0i7PhURfPfUhDIpL4lHG++J+us+ihZZkdhbpEVmoebS
         gecxLgLW5OkOZGGXYvEBggp01JJ2LTYnKb8+nK9MO+OeQUhDO66UfvW08kMMsGencB+t
         7MjVP6BvkonoDREMPF3kSQwRYdnjXWLbd5MOKrmJXQVWLM9bx5aT8jPpupRdLx4KNWKA
         fwH1d14UkT7XCw3WC4vZF39NrwI80o4JqO/bBZ1FAiVNTSSX3mL9XBsJPsWY1cI9lYkK
         WXlQqIZIISNnoREK7nrJpYVe88Ab4zpPJt3rioOIE0OFoHDGY3PZnRX5O8MjPEDMxKgv
         UGlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319CK3/v3AkQnLbw3YZqVxJ1ZKmCp2qBvV1q60vTsPHgXBPz7KP
	9CPd4cEXznr8ScW5/1lwyn4=
X-Google-Smtp-Source: ABdhPJxIxukLRfHxQ5dJF/8o84YQTIFGclQINU/VmObNNBZjii4MopJarlvNl+idaJga3YLCpXa6FA==
X-Received: by 2002:a17:906:2484:: with SMTP id e4mr29974317ejb.155.1591199150842;
        Wed, 03 Jun 2020 08:45:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2ac4:: with SMTP id m4ls1104549eje.0.gmail; Wed, 03
 Jun 2020 08:45:50 -0700 (PDT)
X-Received: by 2002:a17:906:c452:: with SMTP id ck18mr11857312ejb.116.1591199149957;
        Wed, 03 Jun 2020 08:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199149; cv=none;
        d=google.com; s=arc-20160816;
        b=Nq1Foj7ILGZR2aY9fjATDgI+mTenp5UnNFkpZjLyt5hNR53f2WMd5S1kuFFfUVHoeh
         m/ZEmNuK+je90MEZGTLk+tEpo1u9Rg5HyYyNAjI9OrOuYQdt8I9BtsVJLe1NidNmvlhn
         y9z035WFf7T+ge9hpuXigK6pSg50MdAekBzWg8blMsLBDdt+s9M0c0Rwwj+iRnJlO8Z7
         PGAGa7ZYydyTmHegCjR9mp+LPwQx1wXlFNd6ypg2CknPTRDWZ7IvpM/hAPwV2B6bagD4
         Cu6yTGBDdcNyUefPKO1mciqmGE+xSp/iZ2eRXK49rAbz3jNVijci4fD78v/yLHRti378
         OlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TiGRjmXG6DtOOZhYMN35vRp4ivH2Mgylhnf/mXYyABM=;
        b=gcoJlqOxgbADZjst1LuMZNlaWf0Z6NfoOQRMGdrAXDx99v9WoReiSnyCeZr805a9pn
         KejlH/k2F62t/0BKek2EIBvMpe3tiPgM7OBUosqq5KkOIhe1uNVaE9JwNYUZigiQGQVh
         p21YN0eCt/GtpOJbmuvOI9rQok1Uc2Benk9Naks6686/zShu/oUVs3+s0yBZ8c3+Fp2x
         tHXHbibN53+q2WZks8pZlcPddqTT4eIg7oGed7ZcBotQngBumNz7x1jV/N8Ceezdt6zY
         ylblnnwMz4CHVtLgel5/9hAGcULb/Reb38kewtCvt3FixHp148Ck0kbxU7/n5q6kwwRw
         daLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a2si146638edq.3.2020.06.03.08.45.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 053FjnET004665
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 17:45:49 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053Fjl26001350;
	Wed, 3 Jun 2020 17:45:48 +0200
Subject: Re: question on Jailhouse-Images network
To: dd <497738387@qq.com>, jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <tencent_800F98F7CFF07895690D05760CB69748C805@qq.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <684ff2b7-9e60-5680-ca8c-c624baeefd85@siemens.com>
Date: Wed, 3 Jun 2020 17:45:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_800F98F7CFF07895690D05760CB69748C805@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 03.06.20 15:30, dd wrote:
> Hello jan!
> I encountered network problems when I boot linux image built from
> jailhouse-images repository on my rpi4.
> I found there is no network on this system, i could not get a ipv4
> address using=C2=A0 eth0.
> and I haven't found a way to configure the network And i can't install
> tools.
> So I wrote this email to ask if this is because the Linux kernel does
> not support related options.
> Is there a way to make the systemnetwork working?

Wireless is supposed to work fine, that's how I connect to my RPi. To
enable it, you need to provide a /etc/network/interfaces.d/wlan file
like this:

allow-hotplug wlan0

iface wlan0 inet dhcp
        wpa-ssid ...
        wpa-psk ...

Just tested eth0 as well, and it worked out of the box but had excessive
latencies.

Note also that my image is a bit older (kernel 5.4.29), and the latest
kernel version may have more issues in this regard.

The RPi support relies on the downstream Raspy kernel, and that in a
version they do not include in Raspbian AFAIK. Unfortunate setup, but,
yeah...

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/684ff2b7-9e60-5680-ca8c-c624baeefd85%40siemens.com.
