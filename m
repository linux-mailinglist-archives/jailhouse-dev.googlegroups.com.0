Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJXU77TQKGQE54EOYRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E13D5F9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:59:51 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id x19sf1239636ljh.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:59:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560279590; cv=pass;
        d=google.com; s=arc-20160816;
        b=kyF6T/E7xM9g7EN0awvw2Ata5BdnYR5DIAHpTASIi5cxa1NT7lAkjs7Szp9NoaNsoq
         SQ7escCO8iN2AzT+k7xlMz/9s6Vkg4bBozE0v8rPVjj+GNi+KcOGgqlCEv/Aj5hSgy0Z
         S1xD/6pX42MEEMPWjzyAu4YyC2Vzwav3ScAS3p/GIpzfytJU+zHcI15aHmzdCecmCLLn
         V81ql7yM436851SEn5e+MV9WLMLQF0ZHeWZpbiUsS8g8jEx5/GQskzbf4zLyljOPwrFc
         iQvPCyWNYuAsO+xf7CStCWfdLHu0XSrkfqYXiIoNWUjArD5qHFzgy1rNoVoVHOPAmbem
         spwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=E1vztEESmPWfazWj1bTFLUItrcRKRpLQrd1l61LdVHk=;
        b=yqnRpr4HdN0WFtlFuhjLfDqPkXiBruKx/ABfVAQs/DKlJErDat2bem6zSRLi3pe8Ad
         Gt/p7IMNJSLlCQToKDx5q9tuKbKv9P3gM4CC1lEuH4txZV5Qrj59TdhbsTd1Mh29/vnk
         hnYXFlsE0m+40zeP3Pcn7qIQyb/JwOZVRoVye+1xNBGjTkYsXXKx56mxxioV+OYNqWMK
         8HfmCwZGMv6LTVzrvmCMEmNaFzzr4k+ciUdRs64w+CeWjSUoK1+Zw9H9HLY6+Pm1n1Er
         Kqyl7b+ZFObyPjB0dvhIg/sVPs0lOgq1atbGAL5rHamkJZKYQ81YrWaKXJrp0sn3GhNs
         pY+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qIGC0eI5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E1vztEESmPWfazWj1bTFLUItrcRKRpLQrd1l61LdVHk=;
        b=Ou2UFtE+cCogptA5WLvx/H6FFttbwDqteElKQmhPt6kXJrq3bGpzbNi25yaT6d00hZ
         lsBDWJgomH2Xn1eAeT8l+UhDiKmOWvf6Q6+u+0wDqvKrXWH/RwygWNX7EkkLyQry9psH
         PepYO6V0naLodDH8pD4+NWgd6sBO+joCUiVYdtLWfTtQQ92lQi6RHV/v2Gue156Hwhl8
         Vj9+bCVlfxzj9oxbMk7676A4PlyhYPGxLVeohn63b/VhfFalOBGMNFyl6mRfMubYGWMp
         vx9E67UpLRJijzu/JQRQlK6FCRVue519YVQ9VJztQG38QMJRd206ibq6wzifORyXwMCi
         9tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E1vztEESmPWfazWj1bTFLUItrcRKRpLQrd1l61LdVHk=;
        b=bmjLneX7ncIaJGF6updZn8nx0LkZIvq/WEPP3Mg5Nbj6Ii77KyXq7bKgBTeQPvY8O+
         vDG2DZUe2SCLVpYJQF5fHa7qwT1crehafjaTrrSu2915r0vOpzopuYQA8ieqCdhTnAlJ
         acX6sJYGEnG+auo3dtzNLACZHLg+sv6+069cHSyqgL0x6Ky87iEeegCUytAhlbQCO5cL
         Br57IJJ7oyv52rBg41im8uxriXUXDdp0/kfLs+YtxYxmRHCxGHTslTPQB66FI2g1J0fd
         8wAfxuBSw17kbMEFEnQdd/y1LZwXXzjp5Ud5oXPMScCGZKQ9+Dal6jQEpsPDGGz8hPEU
         vTLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXsSl7PpCW+MdTYRR3aMghFzjLnLFsPJhu8vjEHcW63tvEHKZ2P
	jh+CBQ9u+tGshQP1AW0D3KU=
X-Google-Smtp-Source: APXvYqwNjsdk0ohKJjEdOOJ6ZLW9hvjtx8WkDPNKCFY6eetDc+19458DBOYakc9qkRsIi0mCV09WXQ==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr11815803ljj.31.1560279590721;
        Tue, 11 Jun 2019 11:59:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4c2e:: with SMTP id u14ls632042lfq.15.gmail; Tue, 11 Jun
 2019 11:59:49 -0700 (PDT)
X-Received: by 2002:a19:c142:: with SMTP id r63mr41622028lff.49.1560279589868;
        Tue, 11 Jun 2019 11:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560279589; cv=none;
        d=google.com; s=arc-20160816;
        b=JDXmmY+rvlG32sI19uJzD6os6TTFqiSX9zZMAo6vPhFOJKwX5hAA3ars4bAawWV73c
         toWdfqbVsoKgdIB2VQyJ4VqOLvM9UK5gQq07Z2h/fdT0KLXrHhbKXXkrjZRnhn4gJMuR
         SRSm7FnR/VfOnZo6PSkyiekRdO45G/B8m7JLpWtguAmBmloFezcI1Bkubgg2cwJ8RlUT
         wPUzAwU7WYab7FMEzoFEIhmKuiL8sUpS/8hlJzvxK7bXq7kq1BGP795CifqySu5i6Cb6
         2eDrnBDjf2CPHNe4RGKaeOpG6Lv6cj15r+i3vT38z+tOm26HVoF0bmMDLWPIc/hBqJiF
         NbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3Bq8iEX4NL+Nl2aBJ9WMpP/T+tn6ObdkTpGXmiGxNAw=;
        b=tgzVlSO03LSeF2zBdj4+xAEC/fj+QXtm07FcOwOfWm2e2MtwgPAxyoF0xkVOkzvE5j
         BZiV37hZM0dYmYaurRLr7nYu6rdi3dknWppxgMAZ+H/T2jTo9O+FZI69n2v05nyDcBS7
         ucc2Yg4zREjVojPk47rDkgtmqrBabMYc/T74ANZt5n7q6rDlAi1B0m/PKL4gZsRjAZnL
         i9PzJl6z8EIjr7bHnDx5FAJDlWzdQSgA0FOQ2NEOs1SWRrttoXSulP9HIZl2tt1OnlH+
         FtoYM5eal3yI5Zbw/gPXp2yRV9Vso/5sPQtyOfQ5TZNerN9dcaIz8MIPcgvsEb8S33If
         elxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qIGC0eI5;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id v29si917461lfq.2.2019.06.11.11.59.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mbydi-1hHSSY2vpO-00JMEg; Tue, 11
 Jun 2019 20:59:49 +0200
Subject: Re: [PATCH v3 10/10] inmates: x86: Add SSE/AVX test inmate
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-11-ralf.ramsauer@oth-regensburg.de>
 <00ddbdcd-b488-80e6-fe47-4d5aa50f038d@web.de>
 <c87fcec1-e509-8851-50b8-1fe26a962f90@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <b6b17677-d3b5-3f37-df53-f8cb267dd64a@web.de>
Date: Tue, 11 Jun 2019 20:59:46 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c87fcec1-e509-8851-50b8-1fe26a962f90@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pB+gsPjbJ1mEErB0qZfL220XsTow+6JYEOUTkOuPX4IjXHJavfz
 QgajpUNWHWX4uWcnBkCfNbm4xUSA2L2gpiDSJOzIFbzdwZe75aqYBrU10JDq79Yteaxba+5
 3uUbmCul/62WUuv5OfXHxyTMzty0afYd2MZo3ucAL4ZKrUoUYQafeqHKQEULA6dvPWn+z+C
 aoOA0ZWggoQBEzws1tbtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KxU5lWWa+CQ=:VSewGvsjBl0kcVHLCO8utL
 gs4b2Q0Hs9C9ooydCjv0v+nxGgirO42dg9wi/fBX7YBNuuYDvPOdVWBaSnPLLRGsOh4aMVOYZ
 kWX1qOf3Az+P1zF3AAtqRO3cgnjipjWQUe0C5y2WoS7+6jqTXQ637ZCtUbyG6+b5SiDIJNjZF
 /W6XdSIiiyG7rxNl6vlaGYvwhhgP7NVsUUNQKOz8n/o22FY7YhpZRlDCutTkld+k2/+4qviuU
 RGt5YcQ4zneWIJ1SL6a0blP6XxLPq/6bT8wh07LkMM9wz0YfogzXtt693t7jb4LCYHrzEArZM
 85M6bRsLvr66DT5hi0U1BgfhVgqmuFE+dD6hQCMUKFUBQvpLmkq5UBCjzRGDrniHror8RkWbH
 Z61JbsFCf4h5GCB2rini3efl6zBHW0xyQ6/goxFlGDox/RaNiOkLTZVlMLbKdXKo0A+6M1oZa
 TjfX2RG5EWY2tbc+LwEjTZ6k+KynTR1fA8+4WuXG/gWpuJPfyNJL8RZBwp1hD2U62YA1HocZn
 ul0vW9TSxdLvPXbFvqOXCJ+xBZwWM8o03HfO2D8WBC1o0cYSMZFAg7LfADhkLjilnB7CF4hQa
 a47jSQGjo4SEB6DThFuPzbUdqkDAKiWXTQI3Cv1iv00K109faELtNB0XpgtgsXxD9vesSZOPJ
 kka6zmi0KeLyqwfmF3imA1MazA210kdZ30vw6WktOCbRzMrhX5+m2hJWudIriTuqVBkBHaNwn
 xq6JM8rFGvW6MAxfvvbU5p3LKyPIM1kqpdwyowML8Jy2yv8DieNXWj1cKPR0TgJagIpSd0EjE
 88E3i+XlTVPgKDKf7AAIvI6Yck9auUsUjc+1jYK+SDTRZYG4C2A2I3c+kgi1tC/DuuHFljkV9
 eELurcwLu1/DojWopYUgjkdVnN8HUNqJ/HeRylsXMarUr+3IBf+8kq4e5B5Yj9E9os7ee5Yi+
 JRpfId7DuAiRG2TL2MheKhLF2mCvQb4YiW6xkhPtAVRNRuxvuAO23
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qIGC0eI5;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.06.19 20:54, Ralf Ramsauer wrote:
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 {
>>
>> Is there an "if" missing? If not, please format and indent in a normal w=
ay.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 double a, b, result;
>
> I use those brackets to scope a, b, and result. Not ok? Then I move the
> variable declaration to the top.

Yes, please, that would be less confusing.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b6b17677-d3b5-3f37-df53-f8cb267dd64a%40web.de.
For more options, visit https://groups.google.com/d/optout.
