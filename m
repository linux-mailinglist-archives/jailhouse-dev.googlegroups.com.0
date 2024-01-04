Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBPWS3GWAMGQE653IBJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3E823D3F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jan 2024 09:16:00 +0100 (CET)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-5ee22efe5eesf3869157b3.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jan 2024 00:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704356159; x=1704960959; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RbbQWNBZvJkuCn3s1BMUnM9HDUA/4PXFLMa0q1xMfSs=;
        b=XJQ8UY1ARhB6JpYY0Ai7y85Y3lzOe+fkXItDhwRXJI6Q35HZTGgEFpTx6jTinWanGx
         zjnRPbieTlY0vaE1FKG3i+vvjzL7hpBNClsOPI4vqihU0vPSbZkt2AIcX42FPayg9GGU
         QUz5i/5KB4RTzukfsv+52+exJ5zm7LyvlFeK9D1iRkFUVerPusMYiY5OTOJeemj1jzpk
         ZIG6yWxrjpHYoPrT7oA1gh2uFtnI/DXDLbIXnLCukyw/L0V6u6JzmMym5+wExbselOTF
         zgBGSTuG68MifsaKES1tFphYIqA57iIAOpqQZvBoK0bXsBlPzXlCUuY+CBgXsD0NZq6U
         2uNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704356159; x=1704960959; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbbQWNBZvJkuCn3s1BMUnM9HDUA/4PXFLMa0q1xMfSs=;
        b=FqnuuT0JVJaY8htmhOQPWoVaXeDfehAns2niUCZ49ll2UIO86I+Yrh2Mkfw3tKLqhr
         oQRQ4zAQmxFrLerv0s1LxnmuwLm6QL8100yj3ls4yfXqH7hD1X4cFn2TgaJMcnW1cz63
         ky2mc29FlUhjWYGQhCRRAcs8xZom7/DfRxaxz+uTk1vYg+6cTX28SaX1fMxoL1vbVQ+n
         ACuD+FDSt98fff2lyBGZ7+hWMs3FdZYhm/w+oWqlAUGJZ99mt3uOPJRZlCXyiFIr4gAn
         JaeIV8HPbzK4BrzDd8FPmZEh0xS0Ezo5HVrazEaLHyL6cgI9YFnc0TExJS4TALIhs/jU
         f7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704356159; x=1704960959;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RbbQWNBZvJkuCn3s1BMUnM9HDUA/4PXFLMa0q1xMfSs=;
        b=vIiec/cJxUqNIwrJ+UNs97Hft346HrdRSAPCsLNH0W38aJXjuPDkDl2sXgyCoIpa26
         4tAcUlTDc2bL4gUj6+VajZ1Z8T9jG9dY3g2Tj/EqUYqwJcVV3QBSe2qwkiipggI+jfNQ
         R8LQOZ/9+L+RHBL5aisAA7vETSGAjnHhAdUtHo+D7Kj3u3MD+480l6NjN8JKEhxsqbKa
         lk1JHPpwLYclOOebRFNY8W3A2oMe3UNHksEUPPBp25iIYZIg5VXKzH1lBrfMAItmHWBV
         4w0mwYbzKEMFDpHR62zRWfNZOlkI9mVu4zJKShsIWvaCJ6Hb1YpZRUR4iXeOWdSNx1cm
         6WzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxM6W3hrX/5Aym7SADZ1GXAN5yPdAtb+QJwER1l/hDOyZMHBQy/
	8lXORxL6RHBkPm8YzRAbFxg=
X-Google-Smtp-Source: AGHT+IHJ/2JheKz9U4EZFMRB8JRQo1CgDMPBy1MkvrH2hZ9PmAF9ZezaNg9Jl4TyfWMxEfZjfiU3pQ==
X-Received: by 2002:a25:d090:0:b0:dbe:a706:a244 with SMTP id h138-20020a25d090000000b00dbea706a244mr186388ybg.66.1704356158809;
        Thu, 04 Jan 2024 00:15:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfcb:0:b0:dbd:c21c:c895 with SMTP id w194-20020a25dfcb000000b00dbdc21cc895ls1436459ybg.1.-pod-prod-07-us;
 Thu, 04 Jan 2024 00:15:57 -0800 (PST)
X-Received: by 2002:a05:690c:d21:b0:5e8:fa92:ee16 with SMTP id cn33-20020a05690c0d2100b005e8fa92ee16mr154171ywb.2.1704356157406;
        Thu, 04 Jan 2024 00:15:57 -0800 (PST)
Date: Thu, 4 Jan 2024 00:15:56 -0800 (PST)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2305fab7-744f-4cef-90fc-08879ff55ae4n@googlegroups.com>
In-Reply-To: <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
Subject: Re: Can't install jailhouse on linux-6.1 arm system
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13542_673910867.1704356156448"
X-Original-Sender: sunxing960116@gmail.com
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

------=_Part_13542_673910867.1704356156448
Content-Type: multipart/alternative; 
	boundary="----=_Part_13543_813328157.1704356156448"

------=_Part_13543_813328157.1704356156448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



I really need this patch

But I can't download it. Can you upload it again? Thank you

=E5=9C=A82023=E5=B9=B410=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 00:48:34<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

>
>
> On 17/10/2023 15:04, Dave Marples wrote:
> > On 17/10/2023 09:48, Dave Marples wrote:
> >> I'm building jailhouse on a arm64 linux 6.1 Debian bookworm system=20
> >> (imx8m, if it matters) using gcc 12.2.0...or, more specfically,=20
> >> failing to build. I get to the module install stage and then get;
> >>
> >>
> >> ERROR: modpost: "__hyp_stub_vectors"=20
> >> [/root/jailhouse/driver/jailhouse.ko] undefined!
> >> ERROR: modpost: "ioremap_page_range"=20
> >> [/root/jailhouse/driver/jailhouse.ko] undefined!
> >> ERROR: modpost: "__get_vm_area_caller"=20
> >> [/root/jailhouse/driver/jailhouse.ko] undefined!
> >> make[2]: *** [scripts/Makefile.modpost:126:=20
> >> /root/jailhouse/Module.symvers] Error 1
> >> make[1]: *** [Makefile:1989: modpost] Error 2
> >> make: *** [Makefile:40: modules] Error 2
> >>
> >>
> >> So far as I can tell I have all of the required KALLSYMS set, so=20
> >> wondered if anyone else had trouble with recent kernels or if I'm=20
> >> missing some magic somewhere?
> >=20
> > Just to start the follow-up on this in case it's useful to anyone else=
=20
> > in future; I figured out that I'd missed the stage of patching the=20
> > kernel ( It might make sense to add a prod for this in the 'Build &=20
> > Installation' instructions ... ) using the patch embedded in=20
> > gen-kernel-build.sh and adjusting to suit my kernel..is there somewhere=
=20
> > else I'm supposed to get that patch from in a cleaner way?
> >=20
> > I'm now at the point where the thing will start, but pretty quickly=20
> > falls over in a big heap;
> >=20
> > # jailhouse enable imx8mm.cell
> > [   62.953888]  jailhouse: firmware: direct-loading firmware=20
> jailhouse.bin
> > [   62.961239] Unable to handle kernel execute from non-executable=20
> > memory at virtual address ffff80000a004000
> > [   62.961239] Unable to handle kernel execute from non-executable=20
> > memory at virtual address ffff80000a004000
> > [   62.961239] Unable to handle kernel execute from non-executable=20
> > memory at virtual address ffff80000a004000
> > [   62.961239] Unable to handle kernel execute from non-executable=20
> > memory at virtual address ffff80000a004000
> > [   62.961248] Mem abort info:
> > [   62.961248] Mem abort info:
> > [   62.961248] Mem abort info:
> > [   62.961249]   ESR =3D 0x000000008600000e
> > [   62.961250]   ESR =3D 0x000000008600000e
> >=20
> > Help still appreciated...Can't help getting the feeling I'm missing a=
=20
> > document somewhere whereby all this lot magically becomes easy...
>
> Did you also apply the patch that I attached? I'm pretty sure that it's=
=20
> missing.
>
> Thanks,
>
> Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2305fab7-744f-4cef-90fc-08879ff55ae4n%40googlegroups.com.

------=_Part_13543_813328157.1704356156448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p style=3D"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &q=
uot;PingFang SC&quot;, Arial, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;=
Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-si=
ze: 16px; font-variant-ligatures: no-common-ligatures;">I really need this =
patch</p><p style=3D"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-f=
amily: &quot;PingFang SC&quot;, Arial, &quot;Hiragino Sans GB&quot;, STHeit=
i, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif=
; font-size: 16px; font-variant-ligatures: no-common-ligatures;">But I can'=
t download it. Can you upload it again? Thank you</p><br /><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B410=
=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 00:48:34&lt;Ralf Rams=
auer> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<br>
<br>On 17/10/2023 15:04, Dave Marples wrote:
<br>&gt; On 17/10/2023 09:48, Dave Marples wrote:
<br>&gt;&gt; I&#39;m building jailhouse on a arm64 linux 6.1 Debian bookwor=
m system=20
<br>&gt;&gt; (imx8m, if it matters) using gcc 12.2.0...or, more specfically=
,=20
<br>&gt;&gt; failing to build. I get to the module install stage and then g=
et;
<br>&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; ERROR: modpost: &quot;__hyp_stub_vectors&quot;=20
<br>&gt;&gt; [/root/jailhouse/driver/jailhouse.ko] undefined!
<br>&gt;&gt; ERROR: modpost: &quot;ioremap_page_range&quot;=20
<br>&gt;&gt; [/root/jailhouse/driver/jailhouse.ko] undefined!
<br>&gt;&gt; ERROR: modpost: &quot;__get_vm_area_caller&quot;=20
<br>&gt;&gt; [/root/jailhouse/driver/jailhouse.ko] undefined!
<br>&gt;&gt; make[2]: *** [scripts/Makefile.modpost:126:=20
<br>&gt;&gt; /root/jailhouse/Module.symvers] Error 1
<br>&gt;&gt; make[1]: *** [Makefile:1989: modpost] Error 2
<br>&gt;&gt; make: *** [Makefile:40: modules] Error 2
<br>&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; So far as I can tell I have all of the required KALLSYMS set, =
so=20
<br>&gt;&gt; wondered if anyone else had trouble with recent kernels or if =
I&#39;m=20
<br>&gt;&gt; missing some magic somewhere?
<br>&gt;=20
<br>&gt; Just to start the follow-up on this in case it&#39;s useful to any=
one else=20
<br>&gt; in future; I figured out that I&#39;d missed the stage of patching=
 the=20
<br>&gt; kernel ( It might make sense to add a prod for this in the &#39;Bu=
ild &amp;=20
<br>&gt; Installation&#39; instructions ... ) using the patch embedded in=
=20
<br>&gt; gen-kernel-build.sh and adjusting to suit my kernel..is there some=
where=20
<br>&gt; else I&#39;m supposed to get that patch from in a cleaner way?
<br>&gt;=20
<br>&gt; I&#39;m now at the point where the thing will start, but pretty qu=
ickly=20
<br>&gt; falls over in a big heap;
<br>&gt;=20
<br>&gt; # jailhouse enable imx8mm.cell
<br>&gt; [=C2=A0=C2=A0 62.953888]=C2=A0 jailhouse: firmware: direct-loading=
 firmware jailhouse.bin
<br>&gt; [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-=
executable=20
<br>&gt; memory at virtual address ffff80000a004000
<br>&gt; [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-=
executable=20
<br>&gt; memory at virtual address ffff80000a004000
<br>&gt; [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-=
executable=20
<br>&gt; memory at virtual address ffff80000a004000
<br>&gt; [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from non-=
executable=20
<br>&gt; memory at virtual address ffff80000a004000
<br>&gt; [=C2=A0=C2=A0 62.961248] Mem abort info:
<br>&gt; [=C2=A0=C2=A0 62.961248] Mem abort info:
<br>&gt; [=C2=A0=C2=A0 62.961248] Mem abort info:
<br>&gt; [=C2=A0=C2=A0 62.961249]=C2=A0=C2=A0 ESR =3D 0x000000008600000e
<br>&gt; [=C2=A0=C2=A0 62.961250]=C2=A0=C2=A0 ESR =3D 0x000000008600000e
<br>&gt;=20
<br>&gt; Help still appreciated...Can&#39;t help getting the feeling I&#39;=
m missing a=20
<br>&gt; document somewhere whereby all this lot magically becomes easy...
<br>
<br>Did you also apply the patch that I attached? I&#39;m pretty sure that =
it&#39;s=20
<br>missing.
<br>
<br>Thanks,
<br>
<br>   Ralf</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2305fab7-744f-4cef-90fc-08879ff55ae4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2305fab7-744f-4cef-90fc-08879ff55ae4n%40googlegroups.co=
m</a>.<br />

------=_Part_13543_813328157.1704356156448--

------=_Part_13542_673910867.1704356156448--
