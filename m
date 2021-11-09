Return-Path: <jailhouse-dev+bncBC653PXTYYERBRHIVCGAMGQEQDRBNNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F5644A970
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Nov 2021 09:41:42 +0100 (CET)
Received: by mail-qt1-x837.google.com with SMTP id s33-20020a05622a1aa100b002acad90320fsf13745575qtc.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Nov 2021 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fVO26GfTHPw85XKDGyDKVUzXW2fEEdCt/QwX7T7yaHc=;
        b=hZf7F00oQ5IOrYI6kmoQp/guNUSCdZReXTt3Ewwzefsi6LRuD9BFlPd6emUCnrA9mL
         f+ua+fVvrHpLfK3Cx0Mjoa12jWZUfFvyNBD4yjalelXAlxyJRL9nBFUFQZmN+K83iMHU
         rNtm4n/sGr0rjpFA5XPbh0PTmmhllYU7oQS2MPD79g5tfeSdjdRyBClbhigF0mb7fy0n
         MHDaDXuTLzqgNxghAbbvpIHsqXqW55ylqTVfE+EOB4k9K6rTPd4gpAhZjER6d4kD2gcm
         Jc433sWCi0upxCw9+doU44d56gqoFPtbs5qIA9ZMLMP+Ad3trhn82ecMLGu0fbarqgos
         2CwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fVO26GfTHPw85XKDGyDKVUzXW2fEEdCt/QwX7T7yaHc=;
        b=jv9shkmxkrye7gw8D9KMfonY4GDZE4JUlbU+CJ2bROvaIVKWk0nCF9FOBZwACQFRsq
         lWuZSpaghg5TcqkC8PKmbdA1u1fnMyp1O36LhRgC9di3iMKXcKmd+hWSj90QtjkNZOsk
         m23jk1JuBXTE+ezqDEYArwqUKGn0V0akzt3CRKFRULXXgqBrm+FSM7Bhs14/WhygJfeg
         2C438HbnAw832BIzcbHkrlw1Fnfczv+FbjRUlYmeWFOkD5nxHZ6H6B6ULSOtLehpB05K
         mD0nMKlotILMF7+7X9ljb9qZMikAO8X/E8HxfsCcaK5U6/9bItikDYUhAf78G6RhMZNq
         0oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fVO26GfTHPw85XKDGyDKVUzXW2fEEdCt/QwX7T7yaHc=;
        b=ov2Pyr/z0izxjKXIvVscdGe5qErEegPNIE4PrwhrhLBJjy36JvNbe1ImTqMTcCSTAo
         GTXLp6jTnHJmHBvSwQlmlpnhplnwt4hHf6ut7V6IxeTJNViYdigdmrcN+BYM8dg+fwO4
         S/Y99qoNsGIMypU4e2heRCGG6EV71q6lwO/SWWbs+ndoYKdS1qWMzl6sqwJkD2QrXytw
         f5Thjl1QaS6InKlot8sZ+GQMMwGOZVZzbgD2ZPwR8apwFsDp18/uvDD4myyHHtgRPlGg
         i0gRkZE8sJXLANEK/iZcE1j3ueWMnJ4g/wU9Ia/7S3IH719MFPN0wbckr3kr2mixzM1O
         3Xpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532y4jEzfNpOGdTvsC3pbDBUKzQRhbKujx0CYRg4Qi4bx5R1LgND
	i103DpVOu8JHVEPej2wL+w4=
X-Google-Smtp-Source: ABdhPJzi1pL2V7xMs7Sb6ClB7iMuzQC63mpF8KE9M6e9S4klA76o+WgeHYxj5qFrpAbdTaqAQUvMyw==
X-Received: by 2002:a05:6214:1d03:: with SMTP id e3mr24691975qvd.61.1636447300543;
        Tue, 09 Nov 2021 00:41:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:45a2:: with SMTP id bp34ls2371698qkb.1.gmail; Tue,
 09 Nov 2021 00:41:40 -0800 (PST)
X-Received: by 2002:ae9:de02:: with SMTP id s2mr4487645qkf.215.1636447299930;
        Tue, 09 Nov 2021 00:41:39 -0800 (PST)
Date: Tue, 9 Nov 2021 00:41:39 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
In-Reply-To: <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2332_1848448355.1636447299357"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_2332_1848448355.1636447299357
Content-Type: multipart/alternative; 
	boundary="----=_Part_2333_1066773224.1636447299357"

------=_Part_2333_1066773224.1636447299357
Content-Type: text/plain; charset="UTF-8"

One more update, I think I have a kernel problem, even without jailhouse 
there are no pci devices, so I will solve this problem and see. 

 Best regards
Moustafa Noufale

>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72ba65bd-dfaf-40b4-87a8-785657132f60n%40googlegroups.com.

------=_Part_2333_1066773224.1636447299357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>One more update, I think I have a kernel problem, even without jailhou=
se there are no pci devices, so I will solve this problem and see. <br></di=
v><div><br></div><div class=3D"gmail_quote"><div>&nbsp;Best regards<span><s=
pan><br></span></span></div><div><span><span>Moustafa Noufale</span></span>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><span><span>=
<br></span></span></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/72ba65bd-dfaf-40b4-87a8-785657132f60n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/72ba65bd-dfaf-40b4-87a8-785657132f60n%40googlegroups.co=
m</a>.<br />

------=_Part_2333_1066773224.1636447299357--

------=_Part_2332_1848448355.1636447299357--
