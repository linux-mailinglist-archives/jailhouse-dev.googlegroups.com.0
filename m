Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6MAYHTAKGQENSIDINA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D214B92
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 16:11:05 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id n23sf12307468edv.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 07:11:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557151865; cv=pass;
        d=google.com; s=arc-20160816;
        b=MC1fNOwTFI6gzkKo4RLupUAASOfhMdZQLpo44fXpMvgyBBZdCdqpjW67UjnX9hnu8r
         uTcqXud/37qWMdzFGert4FySTMrTK3sf97QJa3dAGNeh1u/sRWRWxbVgNLm566rzQZ7D
         +8FS7YOzM2quISx3Q8eMTMjm/KMMYaCWAg5I6RVlf4RX1g1ZwKzFZiis+tR1grvVNsOq
         K4K8ZQfNzpD2H9XEtPPapAFknbdA5dEPqMOW3F6FY3EgwDWkqJIr93EGaWlfy7wOXAUk
         +4zaCAha9qaFqTGjIBlUoWHNK/gXK/BXmEIeBqUjVSV8Sfuc4DUZlOkYWPPaAwBLhFS3
         SlxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=9FZci8DZH8yl1bLC+Vx93T8RJC/nIGZVjQvEUbUAk90=;
        b=LSrhpA5SmNlw8DYgEKG6gtKbryz456Tgw+1CaECftg6nNbUubcY19kja7DLN7aTnDx
         ZCK9G48FeYksXipNG06UeTpKaDgvwogdGCY7O1jO2zoRPoRzZfCAtr3fk6QOCXkj0AHm
         NNCY9LjAgOduUMpUENQ0RVT7NR8hNHPDLEHlflgVzaAKthvr340wQffqUIvFEurxcLEQ
         890ef+E3ud4P0mcNLL/WUpjYXTmbsm/RXUF4hRVzmSRKvP2tEEegydQROy6Z9eN43hhy
         gIAx0tTEXfSGn4xe079D8TF8Q+f5wCrWcUV1FJPvJsrSCw9wpUQS881QaXK0rcfnnmvX
         bQqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9FZci8DZH8yl1bLC+Vx93T8RJC/nIGZVjQvEUbUAk90=;
        b=N88jBkDk4a0kA5deO3IAOB8E9jFz5+upyKxDxG/vdSdK9VP9WnmVQnZnRUHKptRUSn
         C81jloSGgR7HbUPyjcyemOxGyjRN2I9e/qImjL4PvzJMrUUhtQzyFSwsmvNx5iEEJaqk
         FKdZYcjyhAqH7+VBNRYttIORgi6RZZfYG+CZPOshWmfxouhDfrb10sFrMwDmZidQsjiY
         iZae8wO53SrISPBRJk/zCZxoRAhyzoIZDDUuDgO65YsQpIylLtTO4/iAI64AATr3ljb7
         BptROnHzFv1cnfgda6PCs5ybSDnb9FADSB0potzwg+0SbSlHaRkzuzvax6fmOa9LE9Z7
         FLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9FZci8DZH8yl1bLC+Vx93T8RJC/nIGZVjQvEUbUAk90=;
        b=HDh5989BV34dhwxDZjpOrWyBQZ7eKo90tPNmQkqcTJ0jiUQNaEtQW0dW/uZEZUyhGP
         a4QluHIkM2fXU6rxNQGmwuPXlEg9upFkXz27Oj2/jgeNlcHd+6JVmk34CRjj1VoBvvNH
         1qzC5NEHA8nO2gXV0TPVIzU0x8RMz9699ZjDoCjDGPuS3kDQTXUmFpBsuLjqosTz//Eb
         636TYRpVDGiz9XXPMoSlOeo77pfOqYd5XFgUhzD1UQ5lIzTjs6nRhsZ7UbIwcP8OkGwo
         urWNFy3t/ZiZ8X1c7XrgtjpQUxdwy2WUdsSKoY80Z23vX+mZAN0OLicC+pq/WsMZKelu
         cINQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWn78Pz3QMA8JJCosHi0y7qAHhLGJEUrlyujCMReugbrOFtt6xL
	PuXub1Jfsmimtfwc5j3geSs=
X-Google-Smtp-Source: APXvYqxU9R5zOsS7GEPLK85gE6i3DeONZjQlhQpZ13xgTHq5MgO3VfIJ9kRPt6xd2NSn7uIRbkShCw==
X-Received: by 2002:a17:906:3953:: with SMTP id g19mr11063441eje.76.1557151865225;
        Mon, 06 May 2019 07:11:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b806:: with SMTP id j6ls3509324ede.3.gmail; Mon, 06 May
 2019 07:11:04 -0700 (PDT)
X-Received: by 2002:a50:d519:: with SMTP id u25mr26758268edi.185.1557151864489;
        Mon, 06 May 2019 07:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557151864; cv=none;
        d=google.com; s=arc-20160816;
        b=dC5BdXaBSTfVPD65MhgonuGTvPOnYnYYOQNxhngSAGSJDZDdJWpzIZVS3Fg6H+562+
         VZUAvD5tpvcNbtoBp8G0cJJvSO0/wNBRbOqtNnhgHHgj211aHd2oezJdVAzMToulzTJV
         Z7kMfqtVFFMCUAto2n/o1sOniGzoPtyt7Vcr5RGiT8in/cgUKod1wX00Gvi/vNvHz1m7
         3HVrPoo+Cb0WiXntEHG2Wtcrj/UuYRVybG99bjStiQPQfNZ31E0XKCHnkVL7Z39DaSPm
         sFcr8p3VFbue4ykjRFSU3fXA/OdQlame/gCKtqvSvMKpj2upGASb4YBK6ScIN4ANdVYY
         frqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=anIdGTQYOoZXH0d7RjBuBmHevUNQkJvICFkueu+FmyA=;
        b=H1nkYMtP0trikjmguY6puD5GO4Mx039KmlgQLQdGIhA4FNdHFvoSJ3OdP6cIMZ0NpZ
         2CkvB9ASbStil9i2gd+6H4VdVgHB3BHuSveNeIM3mOkGvt1BBmyIyBN/TmwNdht8Y0rP
         RZKOJQsdiR3F0Gy8c9trKPA9rkCiSYExBL8Mvtv5ljo2GbFz6U39CP9En6shDORjDqQt
         KPay2QoA4p01cFUuE50dVqPhRxF3Mi1PIyEeIUbOn5Hi1EAvMgJBedaSVI3lV9q6g6Is
         K7JhrYkvojh+vKwEIiHwqI2AU31hect9aXJ8EK9hVl4ICH6IHdNVjuxA3Rz4da1KOaYx
         lVHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w5si573412edw.1.2019.05.06.07.11.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 07:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x46EB3i1008656
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 16:11:03 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x46EB3FQ005350;
	Mon, 6 May 2019 16:11:03 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: jeanne.romefort@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
Date: Mon, 6 May 2019 16:11:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
> Hello,
> 
> I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
> ACPI DMAR is available, but my hardware-check fails with this
> 
> error :
> 	"Unsupported DMAR Device Scope Structure"
> 
> I also tried on a HP ProLiant DL360p Gen8 but I ended up with the same error...
> 
> 
> Any idea of this trouble ?
> 

Can you share an archive generated by "jailhouse config collect"? Then we can 
analyze locally.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
