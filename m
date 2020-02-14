Return-Path: <jailhouse-dev+bncBCDJXM4674ERBIHFTTZAKGQEQTV2DRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id B820415FB11
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 00:52:01 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id 4sf6134933otd.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 15:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5XANxbto/S6mLrqj2VljgmdilN/PX2iFWkGQ0b5QzEQ=;
        b=KJIIKoOLs3c5zliVu80hgxaWS3rPA5V9ahseUjebcj10CvlJxOOoYiODcaIfRoqkR8
         rsmCQKB1ztSDvEGZI+8Nbs2fpoj+Qg/pat6BbR8WV9UjvB6gHtRT+kObP72mjWPyIzg+
         Uhl8xzPlxg21p9Op1xvjG0j4pwZByNmp3+yGKveI4KYaTVCGM+lCW6lvJH6+tRcpngjT
         bRlRyYrD+gD++QPODazBxEpDoZkQJro5UoJ6zxS6Hf1y70iEMAS2UoW/DonzG8krqfoT
         R8uI3PfT1UcqcXKDrm5m1oFM9yQlJovssfVQyQT+k5bGNEDxDE7guWRikP13vhORf3t8
         bomQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5XANxbto/S6mLrqj2VljgmdilN/PX2iFWkGQ0b5QzEQ=;
        b=uke5kFtNNH2PxWYmHe7dDQiLmjEvpGLonr7J91Ai5fH2EzRSDAPGz2zschWOymd3oB
         k4fIsHNDpMGz7Q8Lp/4G057wUa8BXPvjR7gMNooAlLhG+nf7Gu+9v/zh/bfXb1iRpZaa
         LS/xJx5i+8qbytpkVvxDjyUZyYt4g1SIdCIxphGnr/kRXwGOa9R57dbPRjwcJ47gfRmb
         sXXlBAwXblQYtLWhr0/HOMoHsQKQGeK8fp8HpCFdYiyaEskmfSxtckmVLi3Ns917rfoe
         aDmi2QyrS9umm8tpgbb8gGu/aKcMPiwZ7YVn2yO3QOQLXMhIiF8fAmIo4xJTTWYja5Rt
         k7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5XANxbto/S6mLrqj2VljgmdilN/PX2iFWkGQ0b5QzEQ=;
        b=KpQhlKvQ2u2zFREBWbOriFmHHBbUbriA6dlq8ukkbYfyBHa6EZwUR8YprRP1MkECaa
         0OLcBsKhnQ3K8ugoIEzEGIpSA55i7RVGVsrllS9J8Wy0T5sACBU7aVtKsT5QPwdx0+qv
         kuphbnzKJUNspegN/A3gfibor+XMaEb7fiRA0dv8KIler58PAfobbb7n5ATEP1uN6bP8
         JRHseV7LJ41gFRcsc+iG4UwFrzbO36pS96gXWdBlOTeuP3h+b/vFs2paaoE/C2U73V+c
         f1sQc/ruHgbrZNlKibc8kCgDzTLJvJPODA1qLs3HjeVkMEsVPZIlH+IrfttVWA4QopaL
         EJUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUNjCmdZIwPGgdZdLkTeYBPhAn/8KCrXKVMRP2JrNSW7kVRyA4S
	2VE9gf5ehbk/3Gh4wQgYHog=
X-Google-Smtp-Source: APXvYqwy6gIATr0hq3tY5Kl0CiTEMi+bxYFEC+DRFh8gbQwCUvkLgeRSOdp6jFOdqCHbbztsh3Q1KA==
X-Received: by 2002:a9d:32f:: with SMTP id 44mr4148338otv.234.1581724320591;
        Fri, 14 Feb 2020 15:52:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:3ae:: with SMTP id n14ls188540oie.8.gmail; Fri, 14
 Feb 2020 15:52:00 -0800 (PST)
X-Received: by 2002:a05:6808:7c7:: with SMTP id f7mr3666981oij.58.1581724320005;
        Fri, 14 Feb 2020 15:52:00 -0800 (PST)
Date: Fri, 14 Feb 2020 15:51:59 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7562e73e-cfc3-4df8-8ce2-8986f903d44b@googlegroups.com>
In-Reply-To: <eae57764-d282-e692-f113-b3360c6a06ad@web.de>
References: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
 <eae57764-d282-e692-f113-b3360c6a06ad@web.de>
Subject: Re: Strange newlines for console output
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3539_1819961156.1581724319467"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_3539_1819961156.1581724319467
Content-Type: multipart/alternative; 
	boundary="----=_Part_3540_406794029.1581724319467"

------=_Part_3540_406794029.1581724319467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, February 14, 2020 at 4:00:49 PM UTC-7, Jan Kiszka wrote:
>
> Well, we need the CR because we are also writing to real UARTs.

Oh, right, I guess I didn't realize that hardware UARTs would need to=20
explicitly be told to do both a CR and a LF.
=20

> If there=20
> are tooling issues with the current reverse order (which was simpler to=
=20
> implement IIRC), we can flip that

Well, I'm guessing hardware UARTs don't really care what order the CR and=
=20
LF come in. So if that=E2=80=99s true, then I think it would be a good idea=
 to=20
print CR first, since that's what software expects.
=20

> , e.g. like  this:=20
>
> diff --git a/hypervisor/uart.c b/hypervisor/uart.c=20
> index a43773c2..4f4eba4e 100644=20
> --- a/hypervisor/uart.c=20
> +++ b/hypervisor/uart.c=20
> @@ -19,16 +19,19 @@ struct uart_chip *uart =3D NULL;=20
>
>  void uart_write(const char *msg)=20
>  {=20
> -        char c =3D 0;=20
> +        char c, cached_c =3D 0;=20
>
>          while (1) {=20
> -                if (c =3D=3D '\n')=20
> -                        c =3D '\r';=20
> -                else=20
> -                        c =3D *msg++;=20
> +                c =3D cached_c ? : *msg++;=20
>                  if (!c)=20
>                          break;=20
>
> +                cached_c =3D 0;=20
> +                if (c =3D=3D '\n') {=20
> +                        cached_c =3D c;=20
> +                        c =3D '\r';=20
> +                }=20
> +=20
>                  while (uart->is_busy(uart))=20
>                          cpu_relax();=20
>                  if (panic_in_progress && panic_cpu !=3D=20
> phys_processor_id())=20
>
> Jan=20
>
I think something like this would be good.

I tried this specific example out, and it completely freezes everything.=20
Looking at the code closer, once cached_c is set to '\n', I think it=20
becomes an infinite loop.

Thanks,
-Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7562e73e-cfc3-4df8-8ce2-8986f903d44b%40googlegroups.com.

------=_Part_3540_406794029.1581724319467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Friday, February 14, 2020 at 4:00:49 PM UTC-7, Jan Kisz=
ka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: =
0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Well, we need the CR =
because we are also writing to real UARTs.</blockquote><span id=3D"docs-int=
ernal-guid-eb4beeff-7fff-e104-dfe5-1c0664abef35"><p dir=3D"ltr" style=3D"li=
ne-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-=
size: 10pt; font-family: Arial; background-color: transparent; font-variant=
-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline=
; white-space: pre-wrap;">Oh, right, I guess I didn&#39;t realize that hard=
ware UARTs would need to explicitly be told to do both a CR and a LF.</span=
></p></span><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">I=
f there
<br>are tooling issues with the current reverse order (which was simpler to
<br>implement IIRC), we can flip that</blockquote><div><span id=3D"docs-int=
ernal-guid-48a63491-7fff-85b8-a5a5-326fdcb340f6"><p dir=3D"ltr" style=3D"li=
ne-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-=
size: 10pt; font-family: Arial; background-color: transparent; font-variant=
-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline=
; white-space: pre-wrap;">Well, I&#39;m guessing hardware UARTs don&#39;t r=
eally care what order the CR and LF come in. So if that=E2=80=99s true, the=
n I think it would be a good idea to print CR first, since that&#39;s what =
software expects.</span></p><div>=C2=A0<br></div></span></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px=
 #ccc solid;padding-left: 1ex;">, e.g. like =C2=A0this:
<br>
<br>diff --git a/hypervisor/uart.c b/hypervisor/uart.c
<br>index a43773c2..4f4eba4e 100644
<br>--- a/hypervisor/uart.c
<br>+++ b/hypervisor/uart.c
<br>@@ -19,16 +19,19 @@ struct uart_chip *uart =3D NULL;
<br>
<br>=C2=A0void uart_write(const char *msg)
<br>=C2=A0{
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char c =3D 0;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char c, cached_c =3D 0=
;
<br>
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (1) {
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (c =3D=3D &#39;\n&#39;)
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
c =3D &#39;\r&#39;;
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0else
<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
c =3D *msg++;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0c =3D cached_c ? : *msg++;
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!c)
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<wbr>break;
<br>
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0cached_c =3D 0;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (c =3D=3D &#39;\n&#39;) {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>cached_c =3D c;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
c =3D &#39;\r&#39;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}
<br>+
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (uart-&gt;is_busy(uart))
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0cpu_<wbr>relax();
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (panic_in_progress &amp;&amp; panic_cpu=
 !=3D phys_processor_id())
<br>
<br>Jan
<br></blockquote><div>I think something like this would be good.</div><div>=
<br></div><div>I tried this specific example out, and it completely freezes=
 everything. Looking at the code closer, once cached_c is set to &#39;\n&#3=
9;, I think it becomes an infinite loop.</div><div><br></div><div>Thanks,</=
div><div>-Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7562e73e-cfc3-4df8-8ce2-8986f903d44b%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/7562e73e-cfc3-4df8-8ce2-8986f903d44b%40googlegroups.com<=
/a>.<br />

------=_Part_3540_406794029.1581724319467--

------=_Part_3539_1819961156.1581724319467--
