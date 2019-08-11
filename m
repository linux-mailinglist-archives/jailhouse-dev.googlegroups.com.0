Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJFIYHVAKGQEF3XOAZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DA892EF
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 19:45:08 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y15sf63284540edu.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 10:45:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565545508; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZpJatH9FVO4ShSdbef2X0nA7NgPJNzQ5NB8Pkb4eQW9cDm83LSrH7/kiUCeGLm5D/s
         IAjYPZmYr06wSAfV6fDVAJKpI1SEnJV7I1mhewzhVVAoAu3kjuW54PwWd3Ob9p/Mrq6a
         L2c5e6K5MOY6J7WJhZfSddPI7CKlC25eKVNFVBu+Zf084cu8G4fVmZH1NpvztHCQWX5E
         0q9ws363or3F6Dxml4DXrqVeAWkppkinGiy7pkVaLIOWhVYQs4e4L9LrSGn0Cmj+cuOG
         a+zuiBWv6ByTW5LUx7hOAuTfN6zQtUPUvb61aUfhmocEOx3N1Bq7+RN7rFLj3lNDVaxe
         R9MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=EEoi91kJEJrJTMJwwIOT0jQZx58OfolnMT3OLtJlNHo=;
        b=POu4FCvY1tz6dw+dhN5vxXMnQEGqbTKpFEtpXf/YaXgiXKtBDV9pBPxzjPjCkH3Lic
         W9n59yHt2Uxiom07kRp7s6YkLNcBuTny34+INj2QhAFOnbFidReD8nl9dT7x06RGgjjS
         GT74086HsnTbfco9DTHKHbXshq4QwrjhUfaFQ5N3Xio7LqZ/Ne/yK43SUcKsMw2kw5xt
         fqAor77M1AUCeB60x9nrD6TLc0NErjbbkebByc7lL+XVRmFqPmjTzz/FTNuWWoyplOUC
         u5tyi/Nk/kWuIWYFpvcnP31QKSzWzqdWrL+4m+iVP65jcwzbf7FU1iCliutdpHeR5V79
         dkYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="cQ/ps+gL";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EEoi91kJEJrJTMJwwIOT0jQZx58OfolnMT3OLtJlNHo=;
        b=Siiha7vRYQj097Kb76DjlJu3zPAugfwKJWIkOj9ETRsV2JVlrUdCPJLgebfStyBcJZ
         QgQNcW8NqDMu1WCCLrH4iutGWSIfmILidiRitQFfn4cDwPY4+8LwHdztgY2bQyR5OqWv
         LuCQSiwH7DeIoS0c0aRmFZbIPEJM202qYqtt31fB4O08yCxOGZv6kyk7d8jXK92cZL2n
         fLfBepYKoCNyA5KhZH/RvNsc19YuAndm4+L9mcKTHB0wRQpkJFVjT7DDUjQHIjInyUXP
         oWKa1Kq1WV9Wme1Njql+B2fQz4M1sfgtZ8AY+H2KmO0wPPGhuUPHj3iKGvORcM18OAax
         WTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EEoi91kJEJrJTMJwwIOT0jQZx58OfolnMT3OLtJlNHo=;
        b=tAK7EmGBLuMfCnrgs/XmJgsKzd99g5695q418cjRYWsboT5JJ5F0VJ817x/yChbnDu
         q0lNseriUWFV+jcPT9LnzG9xPlTTPCIZv7gnzOcqkYWtu6cwgrX7q0rMTMohu0scQXwo
         /9I+/632r4UJ2T9L/Wal6fcE5VH9yLDY0fHQfg8YPsmzLfXvZKGwynA/1Zsl5rr+skRg
         bBvsrW1aUremvS9HK3JQbrBDZVGaXoTzdvOJLt+bGgSlDhCQgOnoH0PEjwYlRqt/Z0fu
         pIzvDAORr3F5h8vWKjFiKICC5vQyjFNjaXfzU93UZz0CGR2UUBB5gsCKgyGqn+E7/isz
         4T2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUMMI2T7ACwTxhG5qXNmQ/XdYAN9cO0oMJvGHzNEr3P9Xn5tmjb
	IGscL4PBjucuy0iV1sUhUbo=
X-Google-Smtp-Source: APXvYqz0uT6XgM4FaCnVWP4RnlAIuKtf8nC5cn7uWB4ivaONr8KuNOsNqrWR1QobfAAmoJB0pBUl0w==
X-Received: by 2002:a17:907:212f:: with SMTP id qo15mr6551712ejb.121.1565545508501;
        Sun, 11 Aug 2019 10:45:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ae9a:: with SMTP id e26ls18156136edd.1.gmail; Sun, 11
 Aug 2019 10:45:08 -0700 (PDT)
X-Received: by 2002:aa7:ce91:: with SMTP id y17mr33187482edv.56.1565545508087;
        Sun, 11 Aug 2019 10:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565545508; cv=none;
        d=google.com; s=arc-20160816;
        b=spu2vgwS9uWewYmYmLY7E1xmtzkMkab2wVSzpEn486+BfNdhQppmz2tycAW8XaONVp
         HL5avnsBkcHDTR1cSVFQt0bM5I98g1rb/t0E+wDvAgNcRG6SyNioPNQLoOP56OJjN+hV
         k+nNKaeKQTzLTsJ1IRJVpk/3NibulBcen2Nzy9mFSBnkPqfjQPy8grg0afk440Pp8gWK
         vJIOs5tyqkObw1rmh6A+2PgChlhh6xL0hBlzXEXiEoltbyciBoj98690OJjqBR3oxeNq
         5cB9Hmjo4+BZTn6OLGPJumm4DcNjFopzJ2roQmssKje0TqKO4GMIf8xTn3MUHMhpnTC/
         YT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=cGW8mJ11Qjsv1vmD/NDJvUqqNWhzCJuKZnXfVZ1QTos=;
        b=q8khT/Iy2b++bBfNQ90rY/rXnNdxIHg1+4yHCbWa6lV5wnd85X5nEq0IeeBLZsKWlA
         DWMOkKSnTHPrRT67yV1zNoTzyukjMSzxXu4YErhz7KlAHlU3Qt80HEZL/q6xO/R85hFA
         KDyToJj69yLFhvC6Lt4fxiOkoQaxafp+eEBDpRpQRRRYiY+2+isiDkq3uBTqxIxlLlJB
         cLhUnAhXRspT+HKTQFE2TyGgX6YZkfguynSoMAe0GHzZO8/tWgEBbKOOtH9LuOpgQOfV
         ZbymujYICzQlMgCGfHLIEphpxyrJEWwVAZSNSMUl2WHCwwBIpYAKA639Aua+KANHWZcP
         vMUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="cQ/ps+gL";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id m29si143147edb.3.2019.08.11.10.45.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 10:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LetQh-1ieklY05NP-00qjWk; Sun, 11
 Aug 2019 19:45:07 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
Date: Sun, 11 Aug 2019 19:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lZg0SPqBoecl9A08GyduZ8dJbuWuzFpPZdAu7t3Qdd9CppTV+9e
 WPOQEy17VEfDRZiqU050pFDq4xljG2jHftEpmDCWDiK2JLhEz4EzieCXxZE1hKhFpoy+92n
 L63mx1GlYze5cnIQc1dphwaZPQgokGBpOFPc6NeLxNXpa92dUMUbeHtHNHu0LQD1dtrfeo1
 K4tgWtTNnT/LKDQ0T+pGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Elu6ODYfQw=:twPyIrtwrVbO3u3ymFM127
 K7d8ZpGKYC96F61Kiv2WsEmquXgC3Wpvmi5/Za34nXFm7bLqw0PnxMXMEMB6jzyYwrbqPXKLO
 6grLnNHCCAHRDr3HdputPJd5PW0tX1Uh+Hr7qshGyqOd5U2oek7nYgyB+vek6NfGEyTaWgm5G
 lvp5OGUU63qweZcS8XOFHihH4+s6O/WgOgDlguJ+fcxs5TvpoStpnwllIcQsk2h9BPSVHrO0+
 +qliQf9c6/y154YYTZGEaGa7qnyTYVTyMPn8qMphNCBgxm8uMpZRpqRHXdTxW7LzE7F2Q6LQ5
 k/qtMq5UxqVAkqkAeRG3f2ChqSokcpZhleKUZFt0aDfjO9yqc8VsLCGqxWwLQZCSVuPaRy6cF
 jAMxM3GKC/F5mUh2Ok4xGbXU3xQQZ57u4B/HPFBduz3H+/UPZyX6yNYwvsJbf+TMGnKcDgh0K
 C67SPtmo+GfaDxESZntZLZSP0CUHSkk1C6pEKlzDS9lH5/jAv9gPV2CY8yYBjxz+cJRzGFepN
 dZ/sT9g2rNLOEhZC0wfq1n79ayyvZUucqLmAf5bB6lqHMJFhokvH+gLLXHCJKZapq14qYISXQ
 u5k+RIffSevwRzDhvhAu66/oqGRcadQfrodnJWcGVv/sMNkY4S9NUzv7SnINqi/5vx1hlHrAX
 +jJlYdd/y+5cZQ6khJqJ/XSdg5M5RZRPtAyuQ8XSyiJ0CK5utk0h1j3SwgXyN5zqLCwXKgOU2
 Zm0wayeYBmEqSBV9HYqkZdrRz7aS/a/9EBcqNeWYLTtNYwShSqVZyZKaDSqMJQ93xQdTCPGIf
 8zEe0EnTjdMsqzAtq2rb9nBbs9pJaPXjsPXNEZsyMo5ExBLMrQaY/1kYVcXjV19rB9H1BMJPQ
 MLOkQiPw5vZJ8VMEEKQJmxrtWZU7J470E/Bj3oLKtTcTzYUSQNWf9U1xwJ5bgkufFEjAKk0ON
 kVmUXWBCdrxOsbOJ50zLOL+zfd3OrT87MD3c/dCQJ7NvlhaIeTzQaH0q5SknrDeV88gmWeTjH
 jBBTc9gSEMgVJ5adlsFs0m+uSUY9KZbumFXi2j2wVg/Fbodr4880NFhKEccSKLIr4Iio0ZJsk
 /01hprk6NnsUdZizJ1z1YDWSLSjxtwIH54qVVDrI7rmF5BTHvdVIeAd+nXAjLqfxwH/8ZsZ5s
 M0MBk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="cQ/ps+gL";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 11.08.19 03:47, Jo=C3=A3o Reis wrote:
> In my case, the only command i need to issue in Linux non-root, is to exe=
cute a
> code. So, if there is a way to issue a single command to Linux non-root w=
ithout
> needing to have a single UART for Linux non-root, it could do it too.
>

You can set up an ivshmem-net link, like in the head-less
zynqmp-zcu102-linux-demo-2.

Jan

PS: Still need to look into the cell-linux issue...

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/df7be3b4-a447-0ff1-f43b-ee37bf6513bb%40web.de.
