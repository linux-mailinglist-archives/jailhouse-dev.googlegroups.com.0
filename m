Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBC645KBQMGQEJHG4N7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 590FF362EF8
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 11:44:44 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 3-20020a2e05030000b02900bdd10d6946sf3723482ljf.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Apr 2021 02:44:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618652684; cv=pass;
        d=google.com; s=arc-20160816;
        b=QWDTbsXHUUWnhx6XAcnRf4m6a4vrEkZCdDAETkNjhhWtFJp5AS17mO1G0/l5iNX59V
         SUOdR4s4aabtc2/XGv4GQp8o1Vdh/QPt4B+qcgHMmrhjxnKeMG+TbCeflA5UCwgFZbPO
         gcHxcU/6JTebh6d1cQ0Lh0LYMG/bCiFhRT0+OGTnAXmCqdglfreSfD8xguPuLfhdnaW2
         7dAHOXebUz1pxIhf2zaXfkdSiAxICfLyorOmeONpAxcK6pIT7kx3d7Dl8xVCSFIJdq8U
         Nuh0/UZgtnqSfm+ksUi+4USH+prGsMHgoG5xAQZwZ30E70x1u4bA+PbtLMYnpNQ6gIAH
         hyag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=CU4CtdY7PDMNzwYHk7Qb1ED6Wfw6hB2U0Fkx7kCDuM8=;
        b=GKTNeOnUvHSF48cNB1Ma/CPLRzlYsVnIgDcAZ/P7Eo0lKavDpp6WO2rGPZMDpXLUUz
         nxuMKMrK7Ndv9eUYo9Jhb6RuAfEpEAt9F9OKqWFz0g2QFAQtAoDPwJjP1LQRQfDt7eDw
         Sw+uAvtnujfkpXr8dPZwtQ4BR+h3UCVROud1SOgxKKo/eMPWsQCkR7uOUMUzylvnxw3v
         TSVx2q9ghHVvO67188LocIbVBEYe1gvrLOaG4HibNGyyrukM5W6eWWmdaao7dekXPAzA
         Efbef9f//Sr1mKz81VnpwX2pMvE86BPU5W8PDjnpqmCxWfexfoJmAwnyw7bpg1xUpNtZ
         Q4Tw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QcYXNj5u;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CU4CtdY7PDMNzwYHk7Qb1ED6Wfw6hB2U0Fkx7kCDuM8=;
        b=hobzpyrKnWdNBQmlwCwcGkN1rV1qSU0TgeSR6hK3l5GshptyaAXQPG4cDfp1BiZUbB
         1qzhQQKXUPb8+25mXnocZYITtAVVoXco6tbPRRmPgfqbTz/oKB70ND4m34E8bFq17ajp
         ZbNbwkd3qzgqlt7tIhhhEXLvOzfpGOmV/HxWp8YFGKLoebHJ7ic06Q6yzcRFltctN82Q
         khXplZrLmvdVFKzDXl221NzLWpABGI2/0hFLMLSuCR/wikyP6QdfHJ68v9Vlt79R7dYC
         etXzKKVZkM0UNyEYPZkOJtcXSPSeSMzPeDPPj3WEJqQ0gYwLj+PwYcZZx9PPWyNNEcxU
         vizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CU4CtdY7PDMNzwYHk7Qb1ED6Wfw6hB2U0Fkx7kCDuM8=;
        b=LdLQb8fVJ8ZcveRzL841tg4V3vybpQvqzBQtk5HrTxm3MSUrw0DReYzjNISx2mDQjq
         KCv22DcITrp4fQj8N7DoI04PEbuG9HzHd08QKcCcUJj7jhDv5aNZTw37jjQ1ubX71rCY
         8rWQ9vhz7sh1BakzDrT2kEbVjkPicqjWHRWTfeXIITj6DQyhmV5S9DQ+UWP7Sc3zximB
         NMGGsLTDsvEqNXVcWcw2hy5BhhAQn0JkTvOlt3PNvBilxpS2jPt/fEy12MHLa51Lhe2n
         dLApcM/awRufUJn2g0OeXeIEENYPpcpxpHy3QG6dT8sTl6fISQiSlBTCrwWstqhpdpPn
         lxyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qADueOI2ahxwcjWJ0tZbOoD77fIUeS64ItuB3sReZJ/d3kz6e
	mV1rw0RMaYH7F8y7hwFIakQ=
X-Google-Smtp-Source: ABdhPJw1TOtiNBzW1X6vI2rTatcvRgxkb4jJBqpTPqniD0ZrwXvRcp9JIqAGOszJl9hjR0Y9vRtQrQ==
X-Received: by 2002:ac2:5fa2:: with SMTP id s2mr5861773lfe.486.1618652683834;
        Sat, 17 Apr 2021 02:44:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls3406198lff.3.gmail; Sat, 17
 Apr 2021 02:44:42 -0700 (PDT)
X-Received: by 2002:a05:6512:308a:: with SMTP id z10mr5811781lfd.15.1618652682713;
        Sat, 17 Apr 2021 02:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618652682; cv=none;
        d=google.com; s=arc-20160816;
        b=WVvlCEOgsPBLgu6xBLpgJ+AP4neOSO5yp+RuMZ78TtLBanWVCQ6ziywCdu268yq8iJ
         04/d+vEbHB4l8L5D8SmVgIq7WMUQh/ovCRSiew8aD5u0S6+gafxuTKWJTNvHeU08xJy/
         0ojCGIYnj78EdplP47MhwiqKbsLosJH9eBlv8fBjlQOJHz6QNhF6rGS8Hfs2NgIV+wmx
         Kg+BhtTqwrFQ729PQoOj6/5S4cIK3Bb5EFmeoJd8y1pq3igBfursQjNVTIqx1LAXAvGZ
         llo7a6ErIfbRZet+wn9l2gOalhFZTJM8y/Co+Or9K+3PtZR6pNmyQczFdYDoKZhtbYk7
         WkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=tua8iVRR7GUolhtnzr0NyDWuxGNK5VG3WQwgXRRpU8o=;
        b=pCbcb2qHA75xcMAdPWdn5sS8ykx05nwq3Yq/9pPWpdZgk7y4lPNC/XFTYkFDnEGfmM
         wllLmiOdPgQoQeUAxyReOuFJdruyw8Fu/VYY5LXke/GO0mutkfJXiwy2kp85EOP34lNg
         Xl7c4rm2FITCmMVBAg8wcR19y97rDPCmG2x5heatxGdIXO0IWCS3QLBuaUPhQystqpjx
         sygmWmOtMAGjr3ZTcyxyrUpquan2x+4e09HW2VXC9P4iekJ3+mvlb5/W4xzj/cdojsPb
         /LxmcdMVKyhvfVv8bR8lI2TDWtR4m8Excr6VtpfL23McwT0cM7qxgLteV73tMmwrIUNH
         1rVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QcYXNj5u;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id r2si176314lji.7.2021.04.17.02.44.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 02:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0McWj6-1lGAeX2AD2-00HcIQ; Sat, 17
 Apr 2021 11:44:41 +0200
Subject: Re: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
Date: Sat, 17 Apr 2021 11:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qNLfMEm4UqSQGmDySkc4HeJlwqWG2zea57PVmoh1FnUBkQPtwJR
 Gh5biYaYZ+hVG2Pc+MdKBhOfGOwZd1VIDFe6glVWyjUbdTYkPB/Cgas1EdX3EgwHxx65gXE
 lFdZtRBlGMOc5BabUaevflpcTe+t7Y7clVuR9ikFtu6uOClF1CzJ9coBZx0WB7vOHu6I/96
 fKQjLMZDgMzq84DBR191g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xcwGlVze8Bw=:tysAJQYfLR4qv4VUeHtyj9
 R7uoLx4/85zDN/ynfjlAMpKQxU3ms0IsFAWfFa8EUpPh3vlP9lI1CulDM6GhXWoeyHkZcoN9D
 VOHqr+6rdYcSe6d971JnsbLForttFExyLBYCLl3N/PUFN486lKDpqyIIyf7/IMzT1SUpLN3O5
 dzGNPXyMGl5y4Xzaq+hFU5dLQYeVflfZ15jFOjgKI2eJWSheRwxtStNYsN8uM7/cmZejWQvQL
 pf0u8CQZNU57Ukdla62k7BKfn1yUdVkQivo0e1OrqR1WU5qhQNjr3egDnh+tNnFO+nC3zemFt
 EyoVIb0Iv2hSzJEWmpA4WxR2Lk1Z6dD5CG5nKyCbQRi8nXIfqnny4amndG7084MDMrO4UgJuF
 Bx8kV2MbS+v2TbF2zRzuGrJtlMozNtJsf7DuoCqK1hpALvZBzFrVukdrhvs+kBdSp6nSO2yY5
 rgz+BoGvl7ZUWd9yMy3NV7HLxn/p2b3yX/FY2Gk2/Kz++XapnVen9AlmGeOFvBiWCaEm6+mtW
 0KnmGDMut21wnF+0IphpkrTJIoA59sgC6+Q6ELvVBmBj7wZBli3yeO7CC+JAoEYxAWoe9aPtc
 lpJn2aikH2CwCRPMK1UrGSK5PZWZB51rEZZAvTo6na0x9dSHOfpntUVJcbbInjJRAjUisDU6e
 mVuw+GE3xr7xf9R6Kcw7sNU6Cg/j2PYK2LFRSKrdyYmhSZxScv/6SMnUDRQSAQAayXDAPMA42
 b7KJbtTVyUvoWAF3xLB6wYCcgEJ3kZYf3F+6mG1m8vmGZqSZ548yU7e09YnTnLuONcLV3XvuE
 /CBcN6PJbhIUoENRYnGUuW4n8k9uQxzmLs5OiNpAr8LjzTGVpNqL0NLDnmrcbTnZvFrUqP4/r
 At7HS+eZJMR11erm4chDI1bwc1XIkQZ8oYD+pSIK2zLfy/8r2f4KLPIooIq9HNTG/l3tiOCbk
 xRi/vw3xhn36OV4cH/fnMCzmIGYHZcZLH1r/IhoZkmwx1xmzh53vdngK2jqbacPC1Ulf3wiEy
 MNv//iP7jLYiGywvQTFo/u/92kkr8FV4Wvj2Bls73XEHQ1kA3tIAOYQdO1eTVxYxROGmAyEhY
 PjEnRgN/WS9OTsvvuXjJw8aZcZx9gc1W6bHI+o2qnI+M7J8a6KtQB1y5bkY5z/SiIjNiyNwdW
 VICvQBpkq371ZERCtshYTt3eMp6SvDbiS9jr9rlH1jmqAQuNXIRaztBV6GfFNTfBfpvQU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QcYXNj5u;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

Hi Moustafa,

On 16.04.21 10:29, Moustafa Noufale wrote:
>
> To whom it may concern,
> I am a Master student in Rostock University and I am studying Jailhouse
> this semester as a Master project and I would like to gather information
> about this Hypervisor, as well as I would like to ask, whether it is
> possible to install it on an Ubuntu Virtual Machine? I just need an
> outline, how I can learn it. I spent today reading the code on GitHub,
> but I need more information and appreciate it if you can help me.
>

A good starting point for experiments can be the images generated by
[1], both for KVM VMs, pure QEMU emulation target or also real boards.
Note that emulating target inside a VM will work but using KVM (for x86)
may not or is at least fairly slow. I would recommend a native Linux host.

Then you will find a lot of presentations on Jailhouse on the internet
as well as an (aging) tutorial on how to bring it up on new hardware.

Jan

[1] https://github.com/siemens/jailhouse-images
[2]
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf
[2] https://www.youtube.com/watch?v=7fiJbwmhnRw

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/61de29b4-45a2-8f3b-5937-5cac7dfc2b21%40web.de.
