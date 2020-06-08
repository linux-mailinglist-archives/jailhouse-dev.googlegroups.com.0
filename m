Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ5Z7D3AKGQEO63WKHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C161F1752
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:11:36 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id w27sf5668544lfq.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:11:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591614696; cv=pass;
        d=google.com; s=arc-20160816;
        b=QvirW4j8z7axR7KZPIMq0ymLb4wC1+RGR6N3wg0XVbuPgdJTp3ukq6H4Q5mwfrrP6I
         9TOF1ArL5Q+G9qwqq1ENbhlPkIjKmVoSuboUC4UJcDFjU+5Ym8y5Zb5z+ENGyAA35sio
         jbpttkOUjHym2HjgyCPHQJrdKRI26ZRw9XEpwnf4Qfeug28d+6rkMk1cmQdhz9UU/Hze
         Llgbi+IGZy4n/+lmqL14J0vGEixcz4DYtA7A/Oakba3j1kYjGXpyw0Ec1KslhtGnYrDD
         YQmN1/V/JH7AGlAMlb+noJJqJpexxFi7g6MqB8u4NH6d6Ut28jOoDXHabgTaoPHGE3U8
         ydXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DC7Jyr/9ocInVJ3bXDMn8CU01DEcnKlTYOsu43sCLfY=;
        b=dEU+LsIzeFXrVpOcYckHuoDckND1PD9LhSW1PTJ/QVxvSAeMgAQjGZppbmB1Tzf+bE
         5N2HmExFNARZ6FZHCBpt7o6N901gDxSaePyaXUmxO4ckXkGNNo5jITwpWaX89XL3V9OH
         y9QjpEPAmOYpSYITJwvjugJMQjJP2pXl2l5eDdZJ5tukXyVv/Bz5U8qYICOCA5dnjUTs
         uT3JCgvLZoNwVLzWhUcGgJW8dgZ/4f782gQqovFqG1CHKalDNS980nQucXCJdapPZ2zh
         rqp86qOybZBImrJuWShN4pm2GEyY4QwM9r/bCHfDyG3Atg7bdmaxs/gM3k4RExCs3DLG
         2i+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DC7Jyr/9ocInVJ3bXDMn8CU01DEcnKlTYOsu43sCLfY=;
        b=WwpF14MZOK+AR+se8DmBFt3DopmWX59WNIkzwkS1kxXNipTX+cUKBaF35VlBapN0h9
         2nfDiY1IxTuKC1WUaoU7WM5HX2cnQ/Wq1E3jXlWWY+1UrAWFYvwEAmQ+JBCnPLeZ7Edj
         V9UP6yP41ane/dPjCAcNVaaS1Ui775pvHaM49jUP/C05FTvZkethl02uI7wmreFXu9Xu
         Jc9XHkmks5RQqqFSI94WhQf+zl3HwNXg1FXkB1N1Jj7TJrqWf8XVgAsX1gox6AtK6+Cp
         milpBgtlj42a51XqaPQHFbDnCHeTqE0Ofodu14Z87bnkheyUWs/4PB8HigKqgKC1Gipn
         GiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DC7Jyr/9ocInVJ3bXDMn8CU01DEcnKlTYOsu43sCLfY=;
        b=pb33SyKlrKoA6Sdr2Ke4FdEe99j21n4WsJjQjDl2Lp+oFqvwbErsS/kkj+yCBTpSz2
         WKjNr7xtvFmLERGItBqQdNaRblKEPl3jDaHQelzcglYeMZxmXbtVUx0M62k4mnntIMWB
         6L7SXnLlyZy5qnhJr8NDQg7rSSEhpWNLx7OtiiEcz0kdW4h5I1jU9kgnpAmO0Lmytcyi
         jAi4RJ4kDwu4ZHgTCqWVe6IJ/hv9SDLW+B/HeJVmVgh0rUezcaUCrQwN43JLj8usg5BU
         VyuFwGsRN0E006Hb3A5mE/2fqotQCRVkiYWy/SCpWFJngIQ3zm5hy5C82ZRPx/6GYdXf
         5nLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/tBQjkmtBCGLQn7N/RopT16R0aZl+SFVkkdg1Wu72JGvXAtUo
	9iH/OG/7rOyjxp2q30Nwc4w=
X-Google-Smtp-Source: ABdhPJwPrRnfjc8b1aer1BeSTNYzOmLmAxZizoqrmMduepYzd9QpR0UJqDRR5w3BJOvcN7DVtYqGew==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr12429329lfg.108.1591614695980;
        Mon, 08 Jun 2020 04:11:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a02:: with SMTP id h2ls1454699lja.6.gmail; Mon, 08 Jun
 2020 04:11:35 -0700 (PDT)
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr11443429ljo.29.1591614695171;
        Mon, 08 Jun 2020 04:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591614695; cv=none;
        d=google.com; s=arc-20160816;
        b=yCHw6VOcmW1TQNsfGUQ5/FUZjchwpJWXPF3wpnk/VKGl+IidCZfS9go+ZuiX7ZTw+4
         2p6F0wJZaFE6hlknNW2vwmYACP9zpseJX6E1Cx4TKUTsX6x3pffcO1NUSj/zRn4Ypj+g
         Fjrejzrembrnbt4B/c+elwQLQo09aQoRzCC0wUJH/Rtq+LJGqFoj9zszR8kUijlqxkvQ
         BUotJnII3OqV7HmJVPzkKkl4JrN1KhcJbOvVnOwK5VHBo3YaSJiq3wR7pUylBc8Y6Yvm
         CIYGkDU9LEGuI6jFAYhJwkUk8GsiQIPs/0qdT5jDZ90nD6XXxN6h7PnjyQmGqDgrd2ij
         4/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Jh887KF6z4qxN//KSJ4gUAULlwKoQrbg0lBaegqs9nk=;
        b=D1JSrLlCdQ03e7pZ7UqKmcPUJ+JFs6ORGevn4c2QXuc/sjHeszFAzyiPTLIjjBG6/e
         RjJzsxVydHiVg8yfkrNTUllYO6/oSpKmvn83sauUJCj3eAmPAEvXvCcvhMxMf1VRSz5v
         tLg6NF2/ZbcGes8BWLZfwyhD457bEq3VPA1cqoRoaDiGsnt+oQX+9lNxNKm9JR1RcS3B
         NQ7kUCkmGBsPew/kQf9vdBYmzubVGsXcnmVK/XMjc30FStSHe9zIRJlDyraBAbJFDR5x
         VJKq8soielMIQGbM4omwbl5SuGLVTCSyx2QofqHYQ8hR2CHh37YG26al+/7pBJL7m/bO
         eOcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 130si469172lfi.3.2020.06.08.04.11.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 058BBY09018542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:11:34 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058BBXp7002302;
	Mon, 8 Jun 2020 13:11:34 +0200
Subject: Re: [PATCH v2 8/9] inmates: ivshmem-demo: Parse target from cmdline
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-9-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c904df3e-17f2-1892-9622-3d709ce83d1e@siemens.com>
Date: Mon, 8 Jun 2020 13:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608104255.18358-9-nikhil.nd@ti.com>
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

On 08.06.20 12:42, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Generalize the ivshmem-demo to work on different platforms
> with different number of peers.
> 
> Parse the target interrupt number from command line to allow
> to launch the demo with capability to select the target interrupt.
> Default value for target = 0 since root cell is always available.

Do not change the current behaviour (triangle). Just allow selecting an
alternative target via the command line.

Jan

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  inmates/demos/ivshmem-demo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
> index e7a7f711..188c8af3 100644
> --- a/inmates/demos/ivshmem-demo.c
> +++ b/inmates/demos/ivshmem-demo.c
> @@ -36,7 +36,7 @@
>  
>  static int irq_counter[MAX_VECTORS];
>  static struct ivshmem_dev_data dev;
> -static unsigned int irq_base, vectors;
> +static unsigned int irq_base, vectors, target;
>  
>  struct ivshm_regs {
>  	u32 id;
> @@ -173,7 +173,6 @@ static void init_device(struct ivshmem_dev_data *d)
>  static void send_irq(struct ivshmem_dev_data *d)
>  {
>  	u32 int_no = d->msix_cap > 0 ? (d->id + 1) : 0;
> -	u32 target = d->id < 2 ? (d->id + 1) : 0;
>  
>  	disable_irqs();
>  	printk("\nIVSHMEM: sending IRQ %d to peer %d\n", int_no, target);
> @@ -187,6 +186,7 @@ void inmate_main(void)
>  	int bdf;
>  
>  	irq_base = cmdline_parse_int("irq_base", DEFAULT_IRQ_BASE);
> +	target = cmdline_parse_int("target", 0);
>  
>  	irq_init(irq_handler);
>  	pci_init();
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c904df3e-17f2-1892-9622-3d709ce83d1e%40siemens.com.
