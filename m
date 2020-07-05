Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD4CRH4AKGQEPZBCDWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD4214FB7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 23:07:27 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id v3sf9601674wrq.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 14:07:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593983247; cv=pass;
        d=google.com; s=arc-20160816;
        b=mARG6N1LYljuep9WfYBunrNbK6vMRH48IXBp1msf37X/9FvXf89FEgxReRrxzHb7NV
         74EsB5r5Ygrfs+Ae63ElACenVbILSpS9eWNk1M951gNa0CoQsBmJSHnA72VMLrSUSi+w
         QxKM6yoe2alPpbxy9ELH65IzAABWJgrL9DQ+LP4VjJTY1ixNUkCAzACdytWJVQ8gSmVt
         ehsrSeM0ajbbv15Ih4bPKQayuULKh/NUXjf265Uunx02EmLh5EkxOOLa6XPExU+IxV97
         Yr/ktgmz/HkrS4QpZ++709NKqnZW7ZXAj6R7r12uv+IfcvrqlCGn+gFp59xLx7oBbkl7
         Zncg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=7zIHHx+gzJuL6LHPTrzqh00uxAEHoifxGGjdjuwsPhY=;
        b=t1mma+eW+o2cbh4iO87Pspp+fQMa/zUKxFF0iJukxjg9jkBAXYaA9Pk8B5EvPT9L6x
         xFg2XltZWL84jx7Eh//U3pVaGj3tjzl8TjWn/fOFxSAZy4uV5RPmP89KbQp1GW52kPF4
         gqsNvt1UKUdOilNVRUDp5qFzOAJ2RTppvOhfTEe2NXd2NuhDO1M48CwureIE0J+RMvlH
         nHmDf9i/VH/MvR0D+kizQ/hCK1kZfcQBa1eU+xkOUiPJJBE2AzaM0QJoi4KEkwD/su9y
         ftm31Dhlvw71dWDnYyDzC+bxw3Rs78tT0FpejT739vQ44lGOrbATHljvt8Mbn6t/Qk6D
         YyNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jkm968Ta;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7zIHHx+gzJuL6LHPTrzqh00uxAEHoifxGGjdjuwsPhY=;
        b=aYlHjmhvV0R0vFVLOxru5JwCUQuVP5GOd+taYOKA1pq/MM4gkdNgFiUAAyxyGD7z3V
         wJOS5iWSoR7+gipm9KatBOiaUoFoOdFWdK+HL5IPI6Y+saGxMVVqOhF1P3zSgXm090wy
         54y+In1CX7g/UbbKIHpKb8jKpPhH3OsqKnyMIzApPjVMCGCKXO1cvaClAQISiErVxMfi
         xRTEAJAhNpnI6PlQDYqbEtimEvuJcVOVNaGpwtG8SCWSRwPWE1u7iTMmeigQJFN/L6JF
         j6A8+wniPejOsoUq/NqmBHD3h8NFF+eCnqipvXWyuhyoxPfjCCySyi48yn78rTb23roD
         uqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7zIHHx+gzJuL6LHPTrzqh00uxAEHoifxGGjdjuwsPhY=;
        b=PKl1CQuLUY/7gvpQ9HX8Skz4/v72x30BKfxs4/soUW4TIXTxX82rxdJdzdbaPrNxz1
         QldbyjyiRhsSbycIcs+ryVwIdXWg/PCzKDOOcu9rHkWw0S89b3XJ7AZE00OnnFpuRhUN
         vA2F9WcQ6d+KDh45Pl6yUc857L8grOwUenGOCY47hy2z3nszRbeQvbbWSCi2H5RNy7Bz
         8upccG8eeGEBZr9MkY9myZYBxOYWnGEj2MIyuIGbpyKzkymGUJInd6hnjLlaRKDLnHh7
         J02kDAkQEWF+TWsZQhi1Jo8CksUuchpvtkFiOzN0bz5oyZphQH7YoEVCdjXAcnyJCV6P
         2NIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EoF3hm6OYNY6j0w0jsrhcvidV581ZAcCnxKwpXSLeUjICgoER
	q5hRQjY28NpAE3db9PnGk6Y=
X-Google-Smtp-Source: ABdhPJy8RZC+As+Q7LqkLAEjCXGbuiLs2bOQOPQ/hZlfyaNe++2Uw5dB1bkwqi+TLaEx9TX1JQearA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr48661549wmc.51.1593983247553;
        Sun, 05 Jul 2020 14:07:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f58d:: with SMTP id f13ls6766172wro.1.gmail; Sun, 05 Jul
 2020 14:07:27 -0700 (PDT)
X-Received: by 2002:adf:f388:: with SMTP id m8mr47526502wro.338.1593983246999;
        Sun, 05 Jul 2020 14:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593983246; cv=none;
        d=google.com; s=arc-20160816;
        b=0QP1i/h6V6Q4SqVQgma83ue+IpkX5O2Kr7j4nqcr/MNlDeyXMJwA/FyfatpdMHY87T
         HTr6IsL8UqbJlTdCkGf0CHvZGBGXZtga7vIIlwUOXoTN4dy03jj2u3DkkczQsraz9AJD
         RLaJ5caxMpc2OAv0kZQl22RmHr4tA6Rroj9GTDFFpzxZMfUTV9rTejLiq6b6RW7cxxB+
         XUAvmo/hJwn68sZwPb+NLlvl4Njt4mBK1dZw2DiAoVsKRJ1IHfaPGE1tmbmu1PXU5rN7
         Ja5tRfHsLrIcqF4sh2x/hcJivJ6BuK26woHahXufpY1uoFM9rNcIPrITWgh1JrXt/AfS
         i7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=3QvF3LJu6qGv3IlDBWKIEx7E7zG2w+VArPxFTK0vSJg=;
        b=kMgPMC7iaxPfiI7FZen9hULV9XlvkuAKY0bmeCn7uOGXDT+orTxW0/Rm+g/fQ0l2iO
         1hVir6Prn+FS4mZuZME+M1EUdxNC4lR+35tzfLuHdbPZi9H/jECoklZ4k7LfkOAZJim1
         CpVds/IOxlqhT2s41sgpazwMpLAJLHbjb/6Dg9agFiR/YAqyUgq8wwVXSwWGbc6prsyO
         9V1FPNOFe/EUkvpxy0ine30UmUTJ+n2SaSJOpEIpTKqk2JoMul5VUsLrIpmn/i4WrEzf
         4fKKe43hL9gdkyFX36z2En/f6CRBQN2HUL6g4mnof/Ct47WiysD9BLaAf20gyDi7kXOo
         L0jA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jkm968Ta;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id f143si1734425wmf.1.2020.07.05.14.07.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 14:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8T7E-1jwbi21fd2-004SFF; Sun, 05
 Jul 2020 23:07:26 +0200
Subject: Re: [PATCH 09/11] pyjailhouse: config_parser: add missing components
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f36fe810-3cc2-9fdd-06c3-90863f4b5702@web.de>
Date: Sun, 5 Jul 2020 23:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:K7u6ITGMdngdvfHbKeipH60GYjetDTvwQhGzVV4muShe32nZmoq
 qIRu1EDnXMbVGDUKrrbXRJQdw5SvxV8Q11zQIvAAddyTKHV0U/ItfTOHGiZIBrNQuqn754S
 vG+gRTs+LdSaSQbqGsewJjx6+zJG0fLVHPXf0uNHuzlWmWz7dNNlTCEIWCnGi/aEI7v5bwB
 4aaV9uu+t6REq7y6IirOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o8SYfnW5EtE=:MMQnD2js7bImIsJvMS82Sb
 4nVeyyhqNZR2paw/ohUyNCQGCgY+8jpEHb68pCDRw0DZZfBS4G+q+DhDVQJYSGdIPmZkJpCVq
 O8PCBeLUqHACajwv84J8zb5yEu9jk8ELplgcX22bKVamQteL7n6qjmQ8GuHqptMQ7LZPzMjbI
 Io9AZez/tX5yGfzstakNiUAyQoY9EF6mdFb7uRKUs06lsT6D/YlEIaA8dI0Np0pv7reC7hS6u
 BWo9wfAiVSwDxh99B/fw7E2CmHGkuHopyJDJbwikJIZnOcjJPakRhHi++hnjnO0szpWZ4qNdh
 bsvbYwLQAC/QjWeH+6CZ8jlcUBwh2mJSenltu/9yVRnZ5P2fWuEO4iyFbGA6mNNCaeEAbqYuy
 q8HXaKmKjYUqgokLpQHJfEKQUZbJcagbhY0/dhL29OeJUFRNjLs4++QLbEqJ4+DZFx2n20f2n
 TReCfROwMt2ri15Hb8KSwiIItOVv/BCx4f0Aa0pGwr/Pkzxo2wkXvgJHRwM/EjeNHhxe34RSR
 1kybKRjtvltS2+/8VmM9dfo0TKPx4g+8Vxw8bmukQX83Hgg3UVxs2Kq98bdGPWKqyoTxjfncw
 GV4LftF3M5O8P5fGmJ6vrRZRIIIcQoC+lZBfZSRKYcPFGwRohSKR4awWEINCvwJB40KxRRfcq
 SN2QmXU7F8oZszMXuyJo7KvNjBujjLSVeGP3qUCQ25cUkY5IKXvfWc53rQwxL4+KJKZ8qyfSK
 j+gjSe3CLL1/k7J+LtKr0GQ+WW3j9FwDY132L3PMHz+MYnkt91k+aAYc1P+Od7Vi3aQT7hhBe
 AhCHOX525Wxnv4bDyM4iSZ+aXTB6vrPMY7mkqLdDitLN9t4mkp57HZbKwkjPYRCzmcU0flrR3
 nmK4NmLg2skIbNknf6NtQNQzTwzailzK6SvnHrWZzeNn1End4tABVh1Qp3OMu7YtbvzUH+dRJ
 t05noOp/5eEmb+Tgttiyd5Di6ERKfZ+cJ/DiOq0CuDsfqb2hO931sxc7sMCuNyimGCQ5Lz6Wh
 a2mVukjLh8LS3u7rVKsjGQAmyDoW/525y5C43vkgT3mWme4shsPcKaba2k1QrgjD1IJpnitBF
 kp1OjAIsO30ur5IdI7xAWHJe+dOHZaaIAliR4zFoig46XlCoT7wz5BQ5rwilGxR0iI7cPwZug
 19oAYE4R9lTUbI/89+DP1bVM2sRa3wLSisA/kyyQ/ieURjzyhF98e2PYnyD8E2ozC0Xzs=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=jkm968Ta;       spf=pass
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

On 30.06.20 08:47, Andrej Utz wrote:
> They may not be used right now but will certainly ease the usage of the
> parser API in the future.
>
> Besides I already had written them long ago, so it would be a pity to
> withehld them.

"withheld"

While I understand and appreciate this completion, I'm concern it will
simply bitrot if we do not start to use or at least test it soon. Any
plans in this direction?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f36fe810-3cc2-9fdd-06c3-90863f4b5702%40web.de.
