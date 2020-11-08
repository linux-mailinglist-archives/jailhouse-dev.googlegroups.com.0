Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3OGUH6QKGQENKC37UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 749522AADB3
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 22:30:22 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id r16sf3396832wrw.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 13:30:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604871022; cv=pass;
        d=google.com; s=arc-20160816;
        b=w+BOOLLWc9QaIVEbIAnj1+ektZRWMOg8lWVwnj69qZ8D1xXP20tcKtoBvLG7frEyiP
         SvNGo+yUt3l7ZWaK5VV8AYFofuSqT8i3vMOpJnwP056457dNk+XbGev2015qkVmSLqHE
         oce8M8yuV7ezXs0lq1XIyk5X8VKQDHNXDcH2H6+1Z6qSNQV2v2Y6QbZwiGWkSA0KI7uk
         XSGg6fwfLQebW74UnPvo+UOSXOK+bSWlVE+BhjuUwBQ1sOzea2yRde3gRwnppfazfTRq
         ojaxHVZYo73MtuvfF7KDB2ZljZfpwLfnE+JrGG5DvIIwCnVrndtU0yJ7yZBDzV/tznMG
         uXTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KjhKKnRLQ3mB/Ww6bUa0kW2c6+ToNFbSdH/nlMc1SVI=;
        b=mayky5LRg8U82RoI/MSCqB13lZ2iVVJWHs0oMOD7Gs1Y6yMg2xHyxGwAQ2a1bH7IHR
         XYFPMGldjxdBsf2giYE+i9m/9P3vVJpniLi5lYUiRAsJ2tq19NJqUgqpzoeRfZaW8dD6
         vRv2mUbUqp/IXecvAmmgRq7AftZ9yb+N5gJ4Xh2WQsoPYBGbfJdFlOdyYMoxNkwFTfgI
         jprpzxXupZ5QKOefY5MIAzrRYyxnZEeanZsD9mVJrEqe9UOdnFvvx29TUlDhhD+3/S57
         nwXOjdmjs/JTLQAyEEaRd+5c+VjP272R0uhVnKXVBTErzBJLWXd2zvZ6w76yoSyD4iAC
         nVIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KjhKKnRLQ3mB/Ww6bUa0kW2c6+ToNFbSdH/nlMc1SVI=;
        b=iB0VMY2hnIr+bEEPYDzpiK37r1YmEo9J/NS49dZwqpYrP+mvke+VJSKZmlSG9l+0Eu
         g2HeMdT2KC1h8b4bciUguXujwO0LX1Rf2P/nw8Vz6TBvOfCijX2vA1Al/OlpP2ZVPYxn
         FJzAFi0jaipmFllfKhz8PRyWa0OeNz+qYnwhVy1NpyF/1yoXM87IllqLJq0NMgDCNBbn
         qPHHkgHQ1jIHiEzkPrwmPf9GJ84v700sw53HPoMmjFLjsik8YBPGAzx664afGCvl6G7r
         yz6W72kf5hfd6qPylecG98YAebvjzE/F0baLi5ISM0xFpXf3zQ9nnvxZi94YuoguY37U
         iHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KjhKKnRLQ3mB/Ww6bUa0kW2c6+ToNFbSdH/nlMc1SVI=;
        b=Y1XEex2PjWRELI1YPiYMW6gwcIiErlEdb2puQKbAz7J+t1FikI7OKwj08NT4h1gC3Z
         kb++1NSwKT6Te0OPC4P3w/1uCFWsJfqj0gZutfNnBZaUDbpKyB3fN37J5uC2XUhVey+H
         AAa9WsXb8dBePHzhzkRAinukyHc7Xz3DraNv+byvO8XnKY8y7mpdhP91B805YVHiTAla
         N0F6Oa1quj2xFdlYqkTjllXWfGkW00brpFsOwJFdCwOLGxWtX35kNKtMTliNtx8XFLnf
         6J55q/wKxPZU8P7H3lB941Wa/4AnDnKalr1GGNsARpforTz/X95KvMmmzkFojh8h/sA3
         I2Aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326DPfZoZPm8sYVcEAGwk6XUzFNYYBnTL1k4Yyqf3aRoRhdy6Jb
	sjEM5i9xk0UAClSYOhyTq/4=
X-Google-Smtp-Source: ABdhPJz5Zq9S9xvcEjqcu9iKD2UVwRMRj+UVnKKytm1E+/oT+zpixzrbr6thKEBdbEslUx42zZUpmg==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr11706876wmh.10.1604871022195;
        Sun, 08 Nov 2020 13:30:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls5066029wrc.2.gmail; Sun, 08 Nov
 2020 13:30:20 -0800 (PST)
X-Received: by 2002:a5d:518e:: with SMTP id k14mr15741623wrv.60.1604871020946;
        Sun, 08 Nov 2020 13:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604871020; cv=none;
        d=google.com; s=arc-20160816;
        b=yDS4HPAtvQYgSHURJnyhFEVP/JcpGwIsWVhlM5PYcKv35z7Ip6Pq+O5EpXjmDJ3s86
         lxKWlAhSQkNPF7eY0iScQlZWDwIe5j33hBqVOdkW6O4yQU3BWSf7jOXLyWTv9dso5Sxa
         m26kgY7Urzex96rp9OPWwwMLH/orBfrXGvAGYOwHP+QpEUBD37OCtFouqHUMuTo4sGUJ
         09J5IEFXdEeO2IzjOuYwpeYukKtceYNyJG5Zu5Q8SyA9b8P5le+qW+03FgMQha/QAmxA
         n/TK9uWt5jL2JSSPWWpiLjGb7A/yEmxAdHhBIfOxP1RiUEiCOeaYubnBBXYNBckShlbD
         uECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cPrw8H/LowasTMYP7lzpqAxEdj5MRWFyBhv17mI0VsQ=;
        b=A9BCijz3pwOHZhVOzjh3bbmT5N+h0FWJWF1yTFBF88kvAd+xXPrM/siVZij2NH8BQy
         qGkJkY8yk0KQYy/0S8omxsvgqGJ2go+V7sCgp+hqEES8vU8fUpbrWC6tMd/96xo1QUPw
         tD1sqG2ziaprCe0CQvDCoV9Sr/LdbuOcgijk1yBpgrXjrbZcs71DGlgLY2yjTo3M3ubH
         sWKA1g/OQ8y1oENHc1gba7rY5fhjrnzDmdsosBmUilsr8ADWo6YkQTAZ5mQnmTf9FYkp
         qOwi5E1LuQf0fCX1ljgfigHAsc7KAfuY6yyfyGl+cGIkqsB/Keeo59GzrGV9j12qHS0X
         X7qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j199si182450wmj.0.2020.11.08.13.30.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 13:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A8LUKHN005952
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 22:30:20 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8LUJwU007959;
	Sun, 8 Nov 2020 22:30:20 +0100
Subject: Re: [PATCH v3 07/22] hypervisor: Wsign-compare: force the "right"
 promotion direction
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
 <20201028210933.138379-8-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0669653f-b3a0-d098-5d10-a30a8affcb81@siemens.com>
Date: Sun, 8 Nov 2020 22:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028210933.138379-8-andrea.bastoni@tum.de>
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

On 28.10.20 22:09, Andrea Bastoni wrote:
> Only part of the problem, Wconversion would complain as well.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/pci.c b/hypervisor/pci.c
> index 9274a0b1..6bf5e254 100644
> --- a/hypervisor/pci.c
> +++ b/hypervisor/pci.c
> @@ -24,7 +24,8 @@
>  
>  #define for_each_configured_pci_device(dev, cell)			\
>  	for ((dev) = (cell)->pci_devices;				\
> -	     (dev) - (cell)->pci_devices < (cell)->config->num_pci_devices; \
> +	     ((dev) - (cell)->pci_devices) < 				\
> +				(int)((cell)->config->num_pci_devices); \
>  	     (dev)++)
>  
>  #define for_each_pci_cap(cap, dev, counter)				\
> 

Should be casted on the other end because is always dev >= pci_devices.
Fixed up on merge.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0669653f-b3a0-d098-5d10-a30a8affcb81%40siemens.com.
