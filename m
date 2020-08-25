Return-Path: <jailhouse-dev+bncBD7236HKXYJRBQ43SP5AKGQELFPOV4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE43251457
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 10:37:25 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id b11sf483655qkh.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HxNQL/1mih65GAM9bUH9tcxs1i/uPp4A92oCzfy63zM=;
        b=Sqa+so4YYD0Mzu48JPSOIEXgbJKsvhNBLiVwP6qhjha1qXa2XjiNY49hMyiFL3RJUT
         GpIHAx4T0gubvk4XLlzwrB7/5o6pvDxaMOijy4a3jbMLu+1Bqbt27vpYE7fe9DzIF5bn
         XNyN4lkk8nH7Hdy51sL6gy+V2cbVcFOAT84bVe6jTLK4hzXP602iBUWHKHEfmMJA7tud
         9xke9F/c5p0m44IE2rChAMDz/EUvbLo/EejR7DGq4Vrvj0yZH00H/eHbspKYMLJGK9iQ
         mnU0+EetY+sFveqTWhxzNvjxgTFdLNgkbaKRuo2ya+/EP9Hvxuo+/VM51HxznmW2+5sN
         1i8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HxNQL/1mih65GAM9bUH9tcxs1i/uPp4A92oCzfy63zM=;
        b=g6eOsxEQQrBDMt3oYVk4Gh2hWdnkLRc0ICrRuKuj8KvXJvcjLYjIZHUV+4BhX4FBge
         axTy5UViS7TE6m7Y/l/My2uugoqRK/Y9Yh/zrDIyshuNyzVymAN9JghsysRFLLeZu+Wf
         JrpvXdWIR8ixLv69n+wqbcOglAHAVWCWIAeNzFk1SzarEG1XzCUYBfhctGQGws6ymqWj
         LQC+9SHM+SADn+LSVPQObcX1J5aehgsELGfwqYpOwt3N8I5xhytvCkgc6FjJoc3VW04f
         NRA0Fajb41hU7E7o9IjEIA4ONZXgqT4gWXadxAaXJDt1E54CG4D5DWyOTzUaFwrjs3r0
         nsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HxNQL/1mih65GAM9bUH9tcxs1i/uPp4A92oCzfy63zM=;
        b=cq2LXx1+hONhmBIv4gjI4P6/mDAs2WNGS1FN4/vSbndzkNHwkYNh7h3DN+QWM5I6TR
         A88u3ziGWZQ+Mw4q/jZog4zc4EsyqeTBkb5mWv0Cyx/snVhDWYDKBMV5LiowjCgQIPWO
         y9mznTCs9SVhAmFnad7M96CLVAy3JUlzpAfAPoyC4ZqDOM524eKA1KhFmoFQx8jaDmmm
         7Q4L28QXGjok1uChJPpbJpoTeP3zrYUhKucFjaPrfWQAF7WALWFXvwaIDg0QykvinvKM
         uCNwcDupBIOCMk9LU2RybnbSUM+BG7lb0YVEWKzscl5Fe/ybwI/dCwxawRAvO9xOdYWQ
         Krpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532e6srj5OqOpS41qxL/IyDnfYPmF1mbvXRrXvqjrAboFMHWQxil
	Xh1G8z2TLwzrpsnNtaKJlGE=
X-Google-Smtp-Source: ABdhPJyKcuqd8m1Cu2zb5j3JvWAaKtIyQxcfYfDzY7hFH26jl/p1+v+zm48IJN6JcrIjRVYdIoGnrw==
X-Received: by 2002:ac8:60d4:: with SMTP id i20mr8506352qtm.69.1598344643977;
        Tue, 25 Aug 2020 01:37:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:f408:: with SMTP id y8ls2660445qkl.6.gmail; Tue, 25 Aug
 2020 01:37:23 -0700 (PDT)
X-Received: by 2002:a05:620a:68c:: with SMTP id f12mr8298863qkh.337.1598344643298;
        Tue, 25 Aug 2020 01:37:23 -0700 (PDT)
Date: Tue, 25 Aug 2020 01:37:22 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
In-Reply-To: <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
 <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
Subject: Re: [PATCH-set] pyjailhouse: config_parser - jailhouse cell linux
 throws  an error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_100_135238.1598344642461"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_100_135238.1598344642461
Content-Type: multipart/alternative; 
	boundary="----=_Part_101_2129161895.1598344642461"

------=_Part_101_2129161895.1598344642461
Content-Type: text/plain; charset="UTF-8"

At the current head of the next branch, jailhouse cell linux throws  an 
error:

Traceback (most recent call last):
  File "tools/jailhouse-cell-linux", line 723, in <module>
    config = config_parser.CellConfig(args.config.read())
TypeError: __init__() takes 1 positional argument but 2 were given

Thorsten

PS sorry for probably replying to the wrong patch-thread

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78f3909c-206d-46ba-813b-5dbe5872e7c2n%40googlegroups.com.

------=_Part_101_2129161895.1598344642461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>At the current head of the next branch, jailhouse cell linux throws&nb=
sp; an error:</div><div><br></div><div>Traceback (most recent call last):<b=
r>&nbsp; File "tools/jailhouse-cell-linux", line 723, in &lt;module&gt;<br>=
&nbsp;&nbsp;&nbsp; config =3D config_parser.CellConfig(args.config.read())<=
br>TypeError: __init__() takes 1 positional argument but 2 were given</div>=
<div><br></div><div>Thorsten</div><div><br></div><div>PS sorry for probably=
 replying to the wrong patch-thread<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/78f3909c-206d-46ba-813b-5dbe5872e7c2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/78f3909c-206d-46ba-813b-5dbe5872e7c2n%40googlegroups.co=
m</a>.<br />

------=_Part_101_2129161895.1598344642461--

------=_Part_100_135238.1598344642461--
