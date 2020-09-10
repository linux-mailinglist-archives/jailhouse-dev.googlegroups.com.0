Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBDG3475AKGQEGJNPD5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id B31552640F9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 11:10:37 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id a14sf3673327qtp.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GBgJLxCZGBSEbd71BHR9Ciy1N9AOofSdH/b8UzkQId8=;
        b=E/yea9jcACxgVMLerPgq8x+DtRjGTU7kPNDtKNArmosqtHlD+H3iaChTY6cZFt/i0a
         8Lt1ULR+i2530oRe/jxeDjTOUzCe3hfb6DJTnZgMnFdzOafI+QtiYLzlFFauCe4pH4aW
         yy4mFYfaViW5nq5Q8Z2islgEaAYxa+LXqyvs73jtsUynCg5ocClDvNmf6yWJ4PYC8BW3
         lMal3ZtVyyd53eTnJ92Wo7YJPpRk9WsD2lkOhjMR2D95NG+0Ilb3bxwdxQRvw437P0s0
         ljfPwVBPrckD01xAR/T9DTyL3Wnll4GtjG9tGecfvLPChwkNPUYUkQs5z5Rq694J3V7R
         vUjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GBgJLxCZGBSEbd71BHR9Ciy1N9AOofSdH/b8UzkQId8=;
        b=nBrpwL4wt3Xtk5bmEN/jvocKie1oKokUcW/Tr5z/o/rJnepscnB/FxAJvApFRckXul
         iIF9UxrRr9222y0bs5wWv9M6nFXNXiZfTP1ouhEh5r2PGMiPTx5Xs7vXxyOx6njFMH4v
         LlMBKYyNyhIQAqgJFW4cYjznL9eXcsyIH9leTKyQIwTwAxD7CruuNr+Sibx/NFxP2Zp+
         zg5uropE52KVdnL6XkzB/4Um48uPoL14Z1p/Mpc+XrujcdW0rqN63F99iWrKEFiroZcl
         mBfG1KBmjf8z/lTreWvWmAhP9SP+SyrniYK2rBfY5ifbci6CtygdjyWLpCLt3JeXeB1u
         PHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GBgJLxCZGBSEbd71BHR9Ciy1N9AOofSdH/b8UzkQId8=;
        b=bQ6kOMDehU6BtHr+vEhoOrcio1mKgGjvYs1KxH5D7paBm3C80qRVZnUWMDj6vg3W/4
         uhAwvu0+PVpCXvThyTPtIQTiVUp1Ke2E7w5DvDYhBHXbgaZrBLuq9xoTmLX6oXfg69n2
         dRLH/6tnMvWfLfh6Ip7casPw4klGqDxJ8pjR+SKZyAGTwKhNedYnIlVM8Kg2JqIv03Y9
         bLLjk9uWnML2ecCs+8TLRJtANBdCwsifYpjSfJ5/XidU+atcqwYyTX9QiDg5RNAZAHxq
         RTK00zrcy59ZN2k//QsoOh4+oJKhCZPNu8278JR/YuqVnG76f5QhJnUotq6He/HAsOXz
         rXZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/8W8mNzmdxl6S4Zxtq4jDDQyGjScMkjZFyrWlQwHykB8LwjMk
	EvjUdy6vvSCIcyJg0LtQXeo=
X-Google-Smtp-Source: ABdhPJwnW5ojc+4oj5EuhPLx10xsbiw8qMaNOcSecUMikTKq4+vDF7pj1E0cUOr5TbIw8Jd+hnhcog==
X-Received: by 2002:a37:67d2:: with SMTP id b201mr6834197qkc.96.1599729036659;
        Thu, 10 Sep 2020 02:10:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:2a65:: with SMTP id k34ls2247268qtf.5.gmail; Thu, 10 Sep
 2020 02:10:36 -0700 (PDT)
X-Received: by 2002:ac8:7943:: with SMTP id r3mr6597698qtt.90.1599729036011;
        Thu, 10 Sep 2020 02:10:36 -0700 (PDT)
Date: Thu, 10 Sep 2020 02:10:35 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
In-Reply-To: <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_98_350290913.1599729035125"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_98_350290913.1599729035125
Content-Type: multipart/alternative; 
	boundary="----=_Part_99_2009674810.1599729035125"

------=_Part_99_2009674810.1599729035125
Content-Type: text/plain; charset="UTF-8"

Thank you for the answer.

The Intel NUC8i7 apparently has no UART at all.

I have another target available.
There is a UART (/dev/ttyS0).

However, "dmesg | grep ttyS" gives me the following:
dw-apb-uart.0: ttyS0 at MMIO 0x9131e000 (irq = 43, base_baud = 115200) is a 
16550A

This doesn't seem to be a "legacy UART" with an "normal" I/O port.
Can such a UART jailhouse also use?


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ed7b0bc6-953a-4449-b77e-3d8b2db84e94n%40googlegroups.com.

------=_Part_99_2009674810.1599729035125
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you for the answer.</div><div><br></div><div>The Intel NUC8i7 ap=
parently has no UART at all.</div><div><br></div><div>I have another target=
 available.<br>There is a UART (/dev/ttyS0).<br></div><div><br></div><div>H=
owever, "dmesg | grep ttyS" gives me the following:<br><span style=3D"font-=
family: Courier New;">dw-apb-uart.0: ttyS0 at MMIO 0x9131e000 (irq =3D 43, =
base_baud =3D 115200) is a 16550A</span><br><br>This doesn't seem to be a "=
legacy UART" with an "normal" I/O port.<br>Can such a UART jailhouse also u=
se?<br></div><br><div class=3D"gmail_quote"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ed7b0bc6-953a-4449-b77e-3d8b2db84e94n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ed7b0bc6-953a-4449-b77e-3d8b2db84e94n%40googlegroups.co=
m</a>.<br />

------=_Part_99_2009674810.1599729035125--

------=_Part_98_350290913.1599729035125--
