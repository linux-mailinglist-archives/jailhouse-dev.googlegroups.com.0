Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB27MR34QKGQEQ7E7YUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA4233EEA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jul 2020 08:13:00 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id u26sf5203566lfk.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jul 2020 23:13:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596175979; cv=pass;
        d=google.com; s=arc-20160816;
        b=cP6A5sU/HcpabBuf2Yd4n1vbIyvCiLWjs/wfmPPk4wl3dSFx3iQysNXvUq6JVnsu1Z
         vog1fiUv48/A/G8M7ThCsh/yDKqUyi5WqhvFsXA71v1ryA7n/xxU9Bbk3Bi1grJIIMBN
         bSy8bEaBiwZL4tCsVHpskAB6XzDxpO8iFEPMZ+G0lM0PVCalJ2BsRcw1epjetZUiE8Wm
         c9+6FhZalFsu1H8jML79apmxO2Y+w8qXVmM6JJgTa57k9O/qgj5Z9XMlmSyST7sE/lAQ
         RwgwsQpzrNA0fIj9mKORSNW/yPvr8nou0jHY/DXAVlhdgefjLF3/F7S7ZISFoRTkfht3
         ZsZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=0WH+3VioiV3tuKUTlJRuRQiw0uz66vbjeZS8Y4OdNbQ=;
        b=s4vlghfN4pjK1VVpsfezywR2muwthPTe6dcV+ry2zJnayx5hhB83xgL5i7VD2tGaXO
         reFL0mbbqzoXm0ubHh+4tuQnHsQldBhgLDKMtBa7lZzyPtoOsIFbQOWlhlNyMJO/2f1F
         J9Rh5/JSZRCt2NWB0GfBqA++V8g4uqlBkAblUGnpDvi7bdEGAevNr1eAcWJt8zm5i+Kq
         sFKIIShgKY4NyA79EqOWjLyrBvfpvFUVdWxXqQ+f9gKBqAA2MeZA1MFPc/CBeIgcUAnl
         RCIdf20921Cyu9j36i3nhRLJLC+Ye/9cSP/f5p1W/oTn066CAdvOZhqcUFekmmhz4PW1
         VikQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=rj4ROayC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0WH+3VioiV3tuKUTlJRuRQiw0uz66vbjeZS8Y4OdNbQ=;
        b=KSNhcxfqWM0QmXhhegGLVtfKqFjKMXKXPm4zUrld9qFHMhelIHRAbx5l87QZZEASUv
         GUZTu//S3/wZt9tzhoXxS2kaHUbeSIpTtoEV2kpwK9wXAuuiPedVEXXUuZdyqmzvNJyM
         VWoss+zQ+Rl4gDkZNuqAMJh89afeymAKTlNiR419SG0zPqOEtpoV9ns45lkeQVP+2hjV
         UjJvYFBb/ml4CpSvlZtli+QA/NTnYXC3NxwJ7DUsO52WbFTst3yNq58OOqAeZRPnWgDU
         X5+urdsbWhnwNv1FOil0PDvRFVtkvSTDKbmLZ5SOVtc79SBQPC24ek3k6B5Ckj1Ln+tR
         Qfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0WH+3VioiV3tuKUTlJRuRQiw0uz66vbjeZS8Y4OdNbQ=;
        b=EQ1gQEaYoDMs2DZhVSA8UtE/ity030Y3X6mr92MfAckb7EfAKZGSp2Ibp+EIPNDkIK
         oKIXPtMkjRZvubJwUhhnCfhabGRP/qxqueBDxB/4nIxF8/r4pUFj5stH0IFa/w8Yvn6X
         UA7YzjgKVGFyfNiaquTke7wcgfEdgtekI6WpbOxLR197tEB+BjSughOU6QnLKeGeAroL
         +w2iRvAHKMfRiBrLaG3UvC67HuZKTVM53rikNVBC1Jk0AMb098+1Ow35c4ABFgWUL+N0
         siZClsC9HMQ4hVq7GgaJf/KVLL8iodnj4nmrnY5F9WIM1rOylEw03+iBQZ7IGg5/K2f7
         MoTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530olJ2h9eSArHKn5O6FaKfmghZRBZhSqGEWE/2FSD9IhnYwz3K5
	R6zkmSDCPEt2Pxyfi8CcLrY=
X-Google-Smtp-Source: ABdhPJyxLcNNxsFGXixYKX/BXgKlG51E55KbNDHATTckUs6ewHoCPVBa7nMIu9lceULb7rX7tKGguw==
X-Received: by 2002:a2e:9d84:: with SMTP id c4mr1188408ljj.46.1596175979624;
        Thu, 30 Jul 2020 23:12:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2243:: with SMTP id i64ls1537816lji.7.gmail; Thu, 30 Jul
 2020 23:12:58 -0700 (PDT)
X-Received: by 2002:a2e:960a:: with SMTP id v10mr1200331ljh.223.1596175978887;
        Thu, 30 Jul 2020 23:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596175978; cv=none;
        d=google.com; s=arc-20160816;
        b=EdZlMfBT0pW46+j2VPCOuAlbvWBqHv7hTOUL1dXh0fhuFTuDMLcU8QnPS6OaJ0jm1W
         c31Qc093QK+6yjYOtUrL22HV8gkXkZnsRlaXymPmHlaBrtuZ/4Zo8ODy+Vnk8SL+TH9e
         McBZB3XtPg2ffVyaj7jN4XD6MLImyCHH9bn/k6X+LFzALmHuLoIgTtBQhh9UvQMn9oPA
         nP96265j1kTHnYe8FlzMEoP9GCtLAvm2Z0AhWCz1PVlTonJhUIb/TbFLsx+T4WGlBfcv
         srtOBN4k3Il5yQkp5ZNVRLJXE8leXRq9ZeWA9tb6drqXo5Vk8EAyRzbqLq4uipfqKRKE
         g8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ETtqiNgqmzmu7X3LZP/MV4dyWvtj4z2IQPtPue99UnU=;
        b=cv64JVf4bt/bYLBn7E1pJTMJT8rW0xSIdCj6NI4W5wODGljTtrY96mQlX/MDO5P6sD
         Xx6g8dQitUbSdkNt0D53lBKPAqdGRlh/5zKhNpvKbv3F3Kr0KUsO1ApnNh2W49WnKpZ7
         h7efdNKwXJqqV04V4NkBt9AWlg0L32h7WIjMVrFWz/uc8d/sBP/A5Y49yN8zwcxTr3LX
         qc5byvTe9qiZ3HMAnioNsmwYGpTFFfcPr8gVWPa2ieIlKzQV++ZA1QuFh+dGRS3qzWtB
         Rn8zdKyhW0+9b9PMuir3NnhH5+7omugAKpPWVtYaPv7VKrFzW3eMS1B3Ye8vYtOJuLoT
         p9tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=rj4ROayC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id h25si515986lja.4.2020.07.30.23.12.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 23:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([88.215.87.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8kX-1ku3N22njl-00tT15; Fri, 31
 Jul 2020 08:12:57 +0200
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: jailhouse-dev@googlegroups.com
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
 <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com>
 <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
Date: Fri, 31 Jul 2020 08:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FEtIEoAcfVy/TTM/WAsBYfFQpJ9yvBMmXqqWKXSh4vgE0j13UxZ
 NwmW0daFs7FUtv8sKnmZQw8Z0HgAnyK//qvFm6A/v6INCAcKwe4PSDfYrnrV7zsTEduWHYS
 sP1LWqFl3bWRry90bM+37nqBngUmimsYBNkbEXCw5OZ0rjrJpD3uEJotn/KM8MtSzyjn09O
 h6KGFGmtr3mRJwAJISWdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SJFti0mQ2XU=:6pbz9udNZ6/LhxH4UDxQUW
 d+M1OjjXD+4HiE5+Ve5/gOyp7nmbG1u0CCrOu8ZqSPwMpQ5TRHnk5ojrmjB78hrI3uiNJd4DY
 XtHAA7XW4/4AY+liAkD3k56ZQEFkx1f08/du00kTVmxzYMQdyh/r3ucMX2Ogabx4axhZ8SYCo
 S6jojjrdhmwD8jhGw27fnALOn5lQRFC9e1gJDW3OqMRcqbnuICu0xts8avcqyqW4tRI2y21IR
 MiDFN3r6GpAxOl6QjY+uoHzfiJiD3JsoyluzgSS9rX2qSE3KdpaCnmIQsYtJqMwsHVLgJGX7G
 SEgRSzrwOuH3G+Q7wXBxOVZ1P7pr+NQh2EMZgRRrbwXNwqSTlMhKSwGj75gpQuueZoJrG88ya
 dkzLLtijCxOQYHBGntu+NqGkFrWDI9e3vgMED0Mikkc/ZPqTFPptjNyt3a+92VGcNRT0QFPLK
 sg9WlTnydLlb7D6YTQxrcTwRl/fcgxbhjYDxXILD6yrI7ZeOHBiaVuqfRPWt5qfbF+fljtYkO
 HvUrOBx1JalrV1v39TzNvS/cD+fFGXckHFmJ4rRRik/lzNZsTnxAkylHRGutg0NQtSQMimSrq
 c0ZdVHqygo3A2GtWFfy+/yhNkL0CrS6fgeKyyRON3lW8hfh4SS7tZvjdy3NggFnJEX05Zcsc6
 V44EIgjG3Yuu/9gnVnKg9csdMnoUQfbKm23/4NjNpp9MMuw2UX7/54txHkSYCSuLbCC82MwnU
 qh6thBcJ415UjHuUilbWhfyWTEM682qlLM3BwehsxOFdlj12DGNqoNGLIAjW0eGIv3c+9W9Jz
 2pVmLfanmu+8wYJUv0GZiwvJx0xQEV1yMMQnni3bXIKXWFypJ9mRR2PxIPatHDWOgmaQaxr6K
 s3fQDFMlx7sQDrzvSucwRYPNdyJ2276KNhpb9is4y2vg3dj3Z1nPmn7nhaTfJwbJSuCXoqMZo
 WdqhJQyxduKx9TWAWK+GAIRnRNqfWoC9jCr4K5khST81GR+lYYbPegjoSB8VchlW1am1bsgbs
 vZvMzFVq08qZwIhTLkoK2BqMPnKiiUgMaBpIxa76IEeRgC/MCqKH2XUV3Vc3hkCFVhhMcVqzZ
 J9RlW6SWm7x8MNjprwTkee8MQVmBqWWdaPFZ+38zoSBgrGPR2fqRpHjbtmaqSdfdRjdtHlEbL
 9ie4Z+GOWJiXaEh1KqTDqKHYPUDdXYeC+9Q5CJrmE80DsXWRu+rzNNGtPETVw1rtzgVVrdvsf
 JAHCd3ZbhkbLQCz9smsfiOFufkeKKvUuobgjXHw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=rj4ROayC;       spf=pass
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

On 30.07.20 18:25, Jakub Lu=C5=BEn=C3=BD wrote:
>     Sorry for the late reply. From your description, I also do not see wh=
y
>     this shouldn't work. Not other changes made than described?
>
>
> No, just renamed the root cell to make sure I use the right config. I
> attached the config to this email.
>
>     If things got that weird, I sometimes instrumented paging_create()
>     (printk) to match the actually performed mappings against expectation=
s.
>     "jailhouse config check" is now also available, just to double-check.
>
>
> Thanks for the idea. I tried adding the line:
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk("paging_create: phys: %lx virt: %lx s=
ize: %lx\n", phys,
> virt, size);
> at the very beginning of paging_create and checked the output on the
> serial console. It seems that the second mapping doesn't happen at all.
> I attached the log with mappings too.
>

The reason for your problem is simple, just check the compiler warning
you added: Your mem_regions array is still only 12 elements while you
added a 13th one...

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e2aed10a-4d8f-1d0a-852a-bd399ac5e667%40web.de.
