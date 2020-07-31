Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBWXSR74QKGQEFIZXKIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3e.google.com (mail-io1-xd3e.google.com [IPv6:2607:f8b0:4864:20::d3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D70234459
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jul 2020 12:58:36 +0200 (CEST)
Received: by mail-io1-xd3e.google.com with SMTP id l18sf20748820ion.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Jul 2020 03:58:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596193115; cv=pass;
        d=google.com; s=arc-20160816;
        b=VfhhElb1wkI1Rfh0CWvbu9rm9Y39p4VAo8quc70RXm0R6xK+EXhkig+qHdaGx76POc
         8MvpQrHKfKw3c8AiBV/YcNJAY2WJYvWJB3MeRAUMcvjFo4+9nsQVkHwBQcD9XuYnBiTF
         XoVjpmKVGWd95oJUpx1CKrmsa54ixuTcmXhqllSx6o2qTHH53+Byj4/xIS8J/A2uRCmc
         arDrlquEsdsUBvPwsqVuCna0mmUuTu+MxZQCM3CgMnLhP3949r5YwjyG4YZsezEjKwZh
         I4oJHXMXXST7kYNQJ7iJ0YJE5PxEX6Bi7PFCYcIHScXV0OAwNIDKIaFmVFD2uJiTXNjv
         PRjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=pmCgpw2NN3M1qVOmBzWupyORnUqg4iZkaQwoxH0hgXM=;
        b=hZrItHFNmKg/D4/CjDeF3S9Ov3P3vD2Y039O9Nyo7mpUbSgfvo05eEgm/a6CQ3sVEq
         dtlsiiR/6NJkIfxvLslJsuaeKgmD0J1f8NwZ1456h2wcc1hV6CtRC+TChmvgsUiT60bo
         aFJGdJwMkhsJ/BX2JpI1lnwMsWkN8bWemC61bIdtIi+0SjGqdpnp8SffFto8OIlU0dw7
         vMOFNsz+yuaeaHaYXHmQk7i04UaxoP26SJguRQt6YEhEJfobt1N1PuHOACWhErG7wpZT
         VtQBd3x8kzopMd2ZIUcKif82nVA6zWdHNcor3E0RwlnGBQAviXGvSAs9+q/fu4bl9ig7
         AJeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=tS9yHN42;
       spf=neutral (google.com: 2607:f8b0:4864:20::335 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pmCgpw2NN3M1qVOmBzWupyORnUqg4iZkaQwoxH0hgXM=;
        b=WXa7nd9kOVYYzNMbdJmL6Knyuv0wFm9U/WKDzBuDWMQLl4g2yg/E92sNVJPYnFo6se
         y0YpcmHWWbkWrkwD6AbN7SiE9jmyXMkLDhkgfKZtiENCZPQGfLGs/bjSqu/CclTBI6BL
         wkYbNOk06KSuaWmXm8YtP0Lrn08fRh2XJ5Rpr80guX727XU7LRH7h0tFMll+9CMx5OjA
         s9Q/sftp8p9P6TR494Ayvn5PcAGkqHr8/MgeqKzWHlhE8bJGE/2z8QfuY2Jik/bqtpMj
         hrhvWC1TVbrWOsU5anR8IdLDxhvVEfPzw6JObeXYf3scbfPdiUm3WGP3Q2yPBV3TWTGR
         ddoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pmCgpw2NN3M1qVOmBzWupyORnUqg4iZkaQwoxH0hgXM=;
        b=V7plj7cv1XFl6uXq/CkZxH9b0cEHe2al3wmO7/ct7nMfz5jIvF6JVmTCd7NUfm/YXJ
         PHVA4pCJTB84pgYpJ5WaY79HBVgFa/Mp7tGhTYLreP3tdaxrN6ROrEqeu2wj8BzWKheQ
         OpbQt4Yhl5DhEW5HwA4PxUByYZV43SzUpkos6QzqOw5+zZQ6dKxGPemt5//lqyxj4kM4
         bUUDkXZQs3Ei3II0rEsSWJhiBfqkaJpU2cMvBrYNyJDGJjXgfAJvgxI9e769BP/ks98Z
         NGIUqvgZ2dTLmR4yDpFrc1M8RMUlIxJYSnV0N/utkBwIBysa6f69mcCzqTNbTkUL/GVY
         GFLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+j6JqqWOQ7zE/2yBOVMrxB5dXl6EKtADqag+xOLU1b5CFxGZv
	DrLFG/Bxws4mfhvSOboetlM=
X-Google-Smtp-Source: ABdhPJzmtIC6WHjzdRQe9d/Gk555Tjk1YFgfvZFq4vF+dSFz0sfPCbaGb9VB5mp75TseuhEeT7gK6A==
X-Received: by 2002:a05:6638:14c1:: with SMTP id l1mr4133182jak.108.1596193115127;
        Fri, 31 Jul 2020 03:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:ab10:: with SMTP id v16ls2327495ilh.10.gmail; Fri, 31
 Jul 2020 03:58:34 -0700 (PDT)
X-Received: by 2002:a92:79c8:: with SMTP id u191mr541055ilc.88.1596193114389;
        Fri, 31 Jul 2020 03:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596193114; cv=none;
        d=google.com; s=arc-20160816;
        b=mABcCgVWI4laHiVJxy4lNshquPDmcoOUWScwXsRzRMwch55pJAKinU7e/2E7+yYZfb
         YQ/L5eAW/vieqINBlTiQthgeUEguxgCSDdASQgIEXtJOAFn2ZBlzUxQFjQL2P2JIKdAq
         PH76NfN+WdqMsssOP+xtTufesU44ZG2YJjdZRq8bVCgsOBo+PyCCRMl8P8nzkNaa/YpV
         W4T9x6DWMMqpu6sXsVh/Ldav/dgb8mbB2SkjVpJ9n+8Q34jTcX7E+HdR5ZvuZaQeR5H2
         sRUZle803Twyihab9osGWP/RP/lFgmb1vU4HLT5lHyf1RJ+MHMRoT/p5oj0LU+ONjT/v
         d2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PD2LoDBDsaiCmuS8gF6fFdhfCab7IPGlucVvOkKCot4=;
        b=Ao8BgMababpa1OmIZa/FIti8wLAd2TBLC61NidR5FoPdlsjCwgJnO3GtpdSoFILOjj
         JfVFbUpwIc1YGL6W2twI2vygj8tmV+ZVclZ/kUZjHHfmBYkgtJUk5nGHy/UaGk0WkW6R
         KxL5jhskhUdoW6Rv2g5XYg1HAT0Tnay+c50EwSwBubSbFV15J574oAx3rEyR/o5UxHmh
         fm8fCyWGa74Vqy9aB9ievY518PbE76M8pj+I5pkILFLIe9qCiee4yh/YZzQdo/OSXir5
         SZdfwCIlmpRQqBKgbHVSd3n6BRi+DQnkBXKtoXsdKcVgd75pG08FSM3ItYAy0szEfF2w
         Oq7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=tS9yHN42;
       spf=neutral (google.com: 2607:f8b0:4864:20::335 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com. [2607:f8b0:4864:20::335])
        by gmr-mx.google.com with ESMTPS id t7si484664ilh.2.2020.07.31.03.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 03:58:33 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::335 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::335;
Received: by mail-ot1-x335.google.com with SMTP id a65so13160004otc.8
        for <jailhouse-dev@googlegroups.com>; Fri, 31 Jul 2020 03:58:33 -0700 (PDT)
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr2316976otn.133.1596193113302;
 Fri, 31 Jul 2020 03:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
 <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com> <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
 <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
In-Reply-To: <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Fri, 31 Jul 2020 12:58:22 +0200
Message-ID: <CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA+TM301BdPRPHkxg@mail.gmail.com>
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000082fe0705abbaab18"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=tS9yHN42;       spf=neutral (google.com: 2607:f8b0:4864:20::335 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--00000000000082fe0705abbaab18
Content-Type: text/plain; charset="UTF-8"

>
> The reason for your problem is simple, just check the compiler warning
> you added: Your mem_regions array is still only 12 elements while you
> added a 13th one...
>

Thanks, works like a charm now! I can't believe I haven't noticed that. At
least I dived a bit into Jailhouse code.
I tried that also on the 2G version I have on hand and it works too. So it
seems that it will be possible to make universal configuration for all the
variants, which is kind of my goal.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA%2BTM301BdPRPHkxg%40mail.gmail.com.

--00000000000082fe0705abbaab18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">The reason for your problem is simple, just check the compil=
er warning<br>you added: Your mem_regions array is still only 12 elements w=
hile you<br>added a 13th one...<br></blockquote></div><br clear=3D"all"></s=
pan><div>Thanks, works like a charm now! I can&#39;t believe=C2=A0I haven&#=
39;t noticed that. At least I dived a bit into Jailhouse code.=C2=A0<br>I t=
ried that also on the 2G version I have on hand and it works too. So it see=
ms that it will be possible to make universal configuration for=C2=A0all th=
e variants, which is kind of my goal.<font color=3D"#888888"><br></font></d=
iv><font color=3D"#888888"><br>Jakub</font></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA%2BTM301BdPRPH=
kxg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA%2BTM=
301BdPRPHkxg%40mail.gmail.com</a>.<br />

--00000000000082fe0705abbaab18--
