Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTEHY3WQKGQEMRO4LMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 42155E2FA1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 12:58:21 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id p20sf8479858eda.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 03:58:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571914701; cv=pass;
        d=google.com; s=arc-20160816;
        b=yhFuNiXeZ6uMk+kdel75kjb+6DiuEJiKcASmE8n3Scc5MjiXpNVcHckXYgJvltNNl5
         gZrF+sByJuEHwYy3OETfJUsFQ6GGNrD9wH+BnpEIvgyFXjb+nqPmQzn5JKLQgmqgAFBd
         tBRKezJsRrYdkYBMctpGghfyw39RzPz7JaahifwlsNLpu0pntYsuDz7e1d7r6DPvBlz+
         0PoXoJ7CAleVUBBemn0dY0ANQl8J+TYUPwe7BDhb7Qt52rnfw+GE2bFGvEf2jqsEaDtL
         7HBq2eEb6/y/efcgP66+wfMXsFzlyovBRkvDL0NKIqDvWk52GSkc8YFiBdizuX21WxT8
         yNQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=sMf9hsUP8DjdMiwiCOaPq3TWnQBeCe8hamCUNnRC28c=;
        b=OhL0e5kmtPvFSHvM7pTaXtFAHPlDrWdROEpzojSdFprsy1puNtm1XFifaGgyZdnw8F
         eg6t9AVWJkV427Iw8hRRmdt/HwsLTymLcTnBpdond1OeSBsjMQW0fKKji+H6qGa+KD/s
         7/ETQBv0RriNpAVghIS5d+E0GKlqMS9WqtaszWW3/eCgGGeRF+Z/8zEWtXWHcSAsGyUf
         dCFqJYOoUU6xytB5jKJTWI5Zpc+UdZ4pjKpS/FXPusqucY2K09vM+bxTYCGo1Doyv2HM
         ZiHsClUqTfP3TEv8fZrmSneafj7LnnV9QI7V1XBZRHXBN7qpgpFWCfZAeV5ztIi7DHtt
         dETA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=g+zX5UtQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sMf9hsUP8DjdMiwiCOaPq3TWnQBeCe8hamCUNnRC28c=;
        b=QWvFJPfK2vyy/HdffbP8uaeFMQE1jsmgqCvPFdOTGPllHFI97xoUWn9Ux2yAQ59hbB
         qu5tasIQ+2h/Gl3gZLHPYevxkL8VFYW5/OhTRpE8qn64aFkDEEL10uBUHEvvZ4Yto9qU
         EVRgG/TfZGHCMABpZWhLBr/Epzn1Eblpy5rk8V5dZN1vCCI6y8we/KYiRrcxR0RPy8Es
         08MlYiKVPbU3Hdcr1f03kceZ0HZHqTsqZKogDgLCCpZ9OHYhWpyUIYfEqx6RMu+cU7d9
         DFo/NMKSuDuvHmUKVsW4yEOcr/2MMmieiPXWDAFSRgtx3RZp5Q6iqiiuCj0NzlK5Uj7F
         doAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sMf9hsUP8DjdMiwiCOaPq3TWnQBeCe8hamCUNnRC28c=;
        b=mRu/JWmrQvyCX+MvcLS0MB9iW8FU+KgLJ+3iK1JRM5Foxcdnrfm/fGuk573rNAHaqN
         wUivBVWK+5KTMibpKHlqbsVFR/BSQGYHbLopV7W2zSy3/b5CgETfZAyevgHh1eiVRsun
         ppmJykzj28znb4fOfhrjkkni3kfrs6g1o3ugaMsEmkh//rURJ2KzxZI4mBbQ5gPY593k
         HJ2TtFSoY+ehQnB4LzKglsv3vfdCxYL1KqZVGZfA1Ujzu4S9Uj2L4gbue2EKe1Tk0vZv
         5qs/3jRFakDoytOEKvrpiaYAbCnHswJkTray8HpFRcsDCxGHn3QLv5CYb/HoCf338Z46
         ZGJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4WtZK+IIN2QLIfD7Uz7sNNLNmoB1iySswDsqdZMolk/LDzZAc
	1cKd+S1GxzYdFEiG0niqznE=
X-Google-Smtp-Source: APXvYqy6uP9pfHveO6E3lLkP6Zt0IHMKEnjn7KYY8Bqib4iPPyVfQRrNGfrRzkjT1YA06osPOV7IXA==
X-Received: by 2002:a50:ee12:: with SMTP id g18mr42114223eds.114.1571914700942;
        Thu, 24 Oct 2019 03:58:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:64b:: with SMTP id u11ls1281945edx.16.gmail; Thu,
 24 Oct 2019 03:58:20 -0700 (PDT)
X-Received: by 2002:a05:6402:13d5:: with SMTP id a21mr43383047edx.242.1571914700079;
        Thu, 24 Oct 2019 03:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571914700; cv=none;
        d=google.com; s=arc-20160816;
        b=K6Kk55Hq8iQjT31eV3YIxl5vO6IuGFOLAheWcbzCvGyIEw3DvZKk7k87pz4cy9oj1h
         r3hOXtKvEMnw2MZ9QvdoPsk/lXbTaJesnhuR9U5K+MWSA/XUF8F4aByeZGOh5rd2CLQv
         ZUwJgymInwvpRb5NYNRLpP3scxkk6ggI2GSAsttTu6UuSsZp7/N26p4f/l5smSOGj/mX
         wlAI01cFzNT8LKW+CNtqfsuB7tVg5RICAbHj0PU3PI3ChSfNa2kclTTf9tKt/flD3Uxy
         wZYRzTNRb/HmYHF2cCMs2HmAaBw+9eUMSIsE/mjCrYOUIw/2nUe+gCkf5GX8Rcv+UuoJ
         UC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Y8sXEnN5z+kGKr+C5RC2mUIEbC6cUrXH849aKqufeXg=;
        b=MKCYYdtF8sVdLWccy5hfV/Th0LOFo/XgQ3+fZckGeoD0DZEmA44rxTIe5bt3e3pV2W
         P0Sb189tBIfKQG6k6AMz5EUffIb9HOAdwxwiRP3GBt7kSQaYC1YZ9iY/7rqPcIrMOuif
         ke2oD/74XtI/IoIuzBBGQk4kCfLTu2GY3UJQB7xnrkqeME9wiMpleP8ktJIKr1/mzUwS
         Eq4gFIMEg/I9s9szOr8JKdrYoo8SGdQgCPcEWWhgbbpwlHaTHU3NomRdH7hyN0CnUd0r
         i+p/hJ9DOcnOgOdMXDCGlheliYpKDAiT1YLEFNdg2cJStey4TZC6m86/aZ42OVc1Uogb
         HhOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=g+zX5UtQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id c31si66067edb.0.2019.10.24.03.58.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 03:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.143] ([188.20.186.1]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUSOp-1iWlcO1HXf-00RJH3; Thu, 24
 Oct 2019 12:58:19 +0200
Subject: Re: kernel build failure
To: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
 <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
 <DB7PR04MB4490DA1071D41C031DA58A75886A0@DB7PR04MB4490.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c1007a6f-94d8-adc8-74b7-e54f0d90c69f@web.de>
Date: Thu, 24 Oct 2019 12:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <DB7PR04MB4490DA1071D41C031DA58A75886A0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qPSiC15MnPdU2bPXm/WDT4fcnh5D7Mq/jT5hrB/l/MizlsFtxKe
 Q0qAodEc3zNAExoF95nXOKyBX/4bhKHoaZg3f1LozL+WUqPW/5XAXC5hNldyZTk9KX7J/iB
 KF8AN0/qp7BDS9Qp2Ov7k3OmCUHuB0xJ7kGl9RbuhjcRnTsjKCGHLJdGlIS1E/jx//HKn5s
 TWegclJjGo9fvYZ5xlgtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DaHNm90IHYs=:j/vPsbbeMzlP86HBp610RE
 eJFZQZRyvqPYYXxbN1Lka2Mil11kMWDWIdFar+P8x7zUEz/4ZAiLvciYD7UDNfiRu1ULqlEpv
 0hY6q7/T6FzkzCTEYqDE5I+I0rwyTFYmTD/O/I+zCiJWwoGh4nORrvFJQBTZD2ubyTjBMi5+F
 crF4vIf20ZdYvKgKvwvjvheEbAKhhTjuxy0Eqg39wJ/fHbuKHMzi5lpfQXAJQKeyxJ0IZ24qF
 E7eyRRwC+WSyjzXURhJ8Kl4NdfeVqDj8BYIeXeVrAPSxyRvW/lFy74Y/RoH7W+lqyyKiQVoCB
 zhKKk0BMqjMFgZDgYU5mfT0gGLWjVVFgJ7tTXv4jB+CTeUnIvguXQdxEHoB52UWyl6Cy7RrBI
 KJsiOYQMdcSdONfGmCPEnpOATXdp7t2cH/6bimbPVe+KAlKYvUrPikpEdo0F2HZQ3pFwyNbn2
 nJ2gDY7bL2S0+v7uvqm8NInJt0x2e02RPnXpIZyPdOEF5QHFYUCXehM/hIbGB1O7e1fkP2zkC
 rb9K8xgFwPCqWQLe2weJ+hCNVRuC8dmPiZppP8rM1BpI4hZE8oKL+pfNssRpDuK8V7jfrb2Xv
 awdWvTjRZ/m2RXln1NTVKjZn5GRuGfdMTjVgCcsHzgPg1hB9Yp+8uK6Fk5kUkUhuXesIV12fi
 ApA2JRfUIj/qxuZf0IZ8DQCYAxiHujZJErWwFJIZVM0Iss43R/JILgT1AoHrPnc3reddpqns0
 K/HGBAM1SahRBh2tuoZ+ZdtyXpRkYw1eODv62dRtAb4nDF2DS4XRGC/RMbqd+uyorFUHMBxKs
 WJCoq7xa6sp01qv6SiO9mHXl/veEQKSsAK8IOqjLLjFXfNYSP3KD2J/X4gZQfZQiJH2OQwNRU
 7M2CW+fxDCk9GRBlpWdNqL7DO2O0sgNVusxWhXVVcCb1URPzYn4kYQH7h7jr3PvvW/49jeTGM
 WlDFscTfWk6FRrRds19Bqy4LOZ0mojPAzCEmCZC03ApHLrukSXy0B3hNBicBjzpHiff34VX9B
 LEubcu39l0WYKe2Cx0j/ks54JLEuc8h2uS8Pk7C5VtwGVI+AvRqFdul29PhIZBicz7simgGna
 hnQqj1HZ/M9qM+86HD4EpIZhHiJd3OnlF01q3w8XX4Wg+HTJzYiZBhrf8nJaj15ycb0ZJxuLm
 Z61HXgEQo3144qxzAj/b7ClPR5a5HdD2v10HECRppe78b1O5/LXSDLlBaII1OCiMFbRzXHZEH
 JymNUnoiSXVvlVw+v0JfL/vyF744Ln5rTGXbOL+CtE55POxGa3bjnIFiGXeE=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=g+zX5UtQ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 24.10.19 12:09, Peng Fan wrote:
>> Subject: Re: kernel build failure
>>
>> On 24.10.19 08:07, 'Lokesh Vutla' via Jailhouse wrote:
>>>
>>>
>>> On 23/10/19 3:47 PM, Peng Fan wrote:
>>>> Hi Jan,
>>>>
>>>> When MODVERSIONS and ASM_MODVERSIONS defined, your
>> queue/jailhouse tree will have build failure for ARM64.
>>>>
>>>> MODPOST vmlinux.o
>>>> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version
>> generation failed, symbol will not be versioned.
>>>>   MODINFO modules.builtin.modinfo
>>>>   LD      .tmp_vmlinux1
>>>> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation
>>>> R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used
>>>> when making a shared object
>>>
>>> allmodconfig fails as well without this hack. We are also carrying
>>> something
>>> similar:
>>>
>>> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.t
>>> i.com%2Fcgit%2Fcgit.cgi%2Fti-linux-kernel%2Fti-linux-kernel.git%2Fcomm
>>>
>> it%2F%3Fh%3Dti-linux-4.19.y%26id%3D6c809904ef4483971166142a12302c
>> 8a052
>>>
>> 2e23f&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Ca21a8c0c9486411f
>> eff908d7
>>>
>> 5869857b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6370750
>> 825381915
>>>
>> 48&amp;sdata=9QXjDYuOkKHrAyoEbIF29oI9a%2BSkulsFtNFK3%2BLOy6M%3
>> D&amp;re
>>> served=0
>>>
>>
>> Cannot reproduce quickly with gcc-7 and current queues/jailhouse. Do I
>> need >=8?
>
> I am using gcc-8.2
>

8.3-2019.03 (arm-rel-8.36)

CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y

Still no "luck". Please share your complete .config.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c1007a6f-94d8-adc8-74b7-e54f0d90c69f%40web.de.
