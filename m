Return-Path: <jailhouse-dev+bncBD7236HKXYJRBHG5ULYAKGQECCLTLZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C212C294
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 14:48:14 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id r8sf7156411oia.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7sWZq5YoLVqMlzFkIQPKlcRbRr3GPHi8p41bpONd1wc=;
        b=jypVwZcOtN/0jmb1gZeXdSuS79jmrqqrIMpCsqHgZc7pnDD4egbfhVO1s7GeIiONqI
         I7UfROIwndNgrF7VQXglX9CO/ofkCRRdJTzNeTnjgVXVu6pv1zXYh+d69TJs0gChHqz2
         IFBZPWPaFbcGciCxlLe+Bil89obX1Qh9MRF8SPdydj3nkSIcHk2QevN10AiPXjFIeUtg
         hr99K+gI96QeWmPQJC9ZfGyJCgqqFkgRh3SSM9lesqcCOdARGktOHjkeo8ZW7iYe62iX
         MDZ/qjKRPLw32d2ArLOk1Yvs09zdx642BulNk80JaAB8PW+c2GvrMsRUBQhhHQrUqSBe
         Y4wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7sWZq5YoLVqMlzFkIQPKlcRbRr3GPHi8p41bpONd1wc=;
        b=p11XIMNv1FkxihlDCncLbJ0MTdfCnSDAvAf0BFKbWlThTKs/j/h4r7k2UfFJelPOqi
         JWK0th7xdYZYeeaUNpQGMuo1tAsdu4TypFb9BOa7DqqsscKsLPsAt0Y+lXFjzygd6GQp
         9C0B05kCKE9/+FZLwhfr/f1grWVgxurll2KquqCDxKF/dCCNXfvHPFhKD77tkCERFzvG
         6pd146lxWV4wVNQvc7A9IPKXm45MF7yf7+QGOl7pUHXWeJhTQSXOoFysqvaEsAzvcGvE
         EQJNEO7d5ta2w3BsBLjrociKlwgQMc06d5A8er9YeK02/PHgCtfOAkg1+eENsWls/GuV
         3OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7sWZq5YoLVqMlzFkIQPKlcRbRr3GPHi8p41bpONd1wc=;
        b=FFc33R7hnRTqUstblT1Lq3ek4i/Wft0aSvGUwOWQZsfJH4w+Zhs4a4aYZl5tumZZBH
         4iRs4mhqDjpv1oiGZKkAD7k8xUdWpGgKDXg8tpb5DE+RUvBla8ELVPQhSH6bWeEwueU1
         /wupWe7LCQlYGlTvgqIizfiHRkeQidMFtOVYyUJ972aG7kdwLoMNhS8TsAf4CzUMqbhN
         fdBsuK2EIiA3V42izsnCGbnEiUgmllxhLskowwJ+ZTzkMnnhQBnXA3FEYT9cVyxPZnVQ
         YV60uZcif4ZLfy+BT/S3Eoc1+pF4D67n9v4qt1EToV7U1XyATn+pAQxUNDPxhmUoGnk4
         q1VQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXR485XZqOHoa5iiIV7hUcsUQLs2KyftjkrTESfKulezrnqSk7K
	Pf6Z5Jt3utSaJcRQ1dG2XAE=
X-Google-Smtp-Source: APXvYqwHwsAg6Tdr9Z9+w+dN5aHJghLXrXa+lLbTOefpvQUnHu6LjellQIHd/hBea7KGCzaFXh4ILg==
X-Received: by 2002:a9d:3676:: with SMTP id w109mr50385425otb.35.1577627292853;
        Sun, 29 Dec 2019 05:48:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:611c:: with SMTP id i28ls9699102otj.3.gmail; Sun, 29 Dec
 2019 05:48:12 -0800 (PST)
X-Received: by 2002:a9d:588c:: with SMTP id x12mr66477209otg.2.1577627292295;
        Sun, 29 Dec 2019 05:48:12 -0800 (PST)
Date: Sun, 29 Dec 2019 05:48:11 -0800 (PST)
From: contact.thorsten@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e1cf5d91-32f4-4917-86eb-a1cc95140da7@googlegroups.com>
In-Reply-To: <4d491b38-28d8-a0ea-4cb1-1499957997bd@web.de>
References: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
 <4d491b38-28d8-a0ea-4cb1-1499957997bd@web.de>
Subject: Re: [jailhouse-images] qemu examples stalls to enable with -EIO
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2327_477553063.1577627291665"
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

------=_Part_2327_477553063.1577627291665
Content-Type: multipart/alternative; 
	boundary="----=_Part_2328_1537920590.1577627291666"

------=_Part_2328_1537920590.1577627291666
Content-Type: text/plain; charset="UTF-8"


Am Sonntag, 29. Dezember 2019 11:48:45 UTC+1 schrieb Jan Kiszka:
>
>
> Are you using jailhouse-images master, ie. -cpu host,...? Or was this 
> -cpu kvm64? 
>
> This may still be a limitation of the host CPU.
>

just for completion: I tried the *same* image as before on two other 
machines I happened to have available. Both Debians (and same qemu) and 
Intel processors:

Core i5-8265U, also a Thinkpad, just 'slightly' newer:
XSAVES and INVPCID both come up 'ok', jailhouse working fine

Core i5-3470, sort of older "Consumer Desktop"
XSAVES and INVPCID both come up as "missing (optional)", all checks 
passing, jailhouse working fine
This processor is missing the two features in the first place, checking 
/proc/cpuinfo in the hosting Linux

So the former i5-6200U is a bit of a slacker, pretending a feature but not 
providing it, when needed ;)

cheers,
Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e1cf5d91-32f4-4917-86eb-a1cc95140da7%40googlegroups.com.

------=_Part_2328_1537920590.1577627291666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div>Am Sonntag, 29. Dezember 2019 11:48:45 UTC+1 sc=
hrieb Jan Kiszka:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margi=
n-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><br>Are you u=
sing jailhouse-images master, ie. -cpu host,...? Or was this
<br>-cpu kvm64?
<br>
<br>This may still be a limitation of the host CPU.<br></blockquote><div><b=
r></div><div>just for completion: I tried the <i>same</i> image as before o=
n two other machines I happened to have available. Both Debians (and same q=
emu) and Intel processors:</div><div><br></div><div>Core i5-8265U, also a T=
hinkpad, just &#39;slightly&#39; newer:</div><div style=3D"margin-left: 40p=
x;"> XSAVES and INVPCID both come up &#39;ok&#39;, jailhouse working fine<b=
r></div><div><br></div><div>Core i5-3470, sort of older &quot;Consumer Desk=
top&quot;</div><div style=3D"margin-left: 40px;">XSAVES and INVPCID both co=
me up as &quot;missing (optional)&quot;, all checks passing, jailhouse work=
ing fine</div><div style=3D"margin-left: 40px;">This processor is missing t=
he two features in the first place, checking /proc/cpuinfo in the hosting L=
inux<br></div><div><br></div><div>So the former i5-6200U is a bit of a slac=
ker, pretending a feature but not providing it, when needed ;)</div><div><b=
r></div><div>cheers,<br>Thorsten<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e1cf5d91-32f4-4917-86eb-a1cc95140da7%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e1cf5d91-32f4-4917-86eb-a1cc95140da7%40googlegroups.com<=
/a>.<br />

------=_Part_2328_1537920590.1577627291666--

------=_Part_2327_477553063.1577627291665--
