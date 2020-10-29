Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBD4P5L6AKGQEV7FD6JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F029E6FF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 10:12:48 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id w189sf1355462qkd.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mEhyUZRTeqc69V/g+d49yqJOFhHnKBtmvBDRVm8lrYo=;
        b=qRMLqVJwFKzKQ+q0QGkdW1NwK0xUGE1FXvqmWy1AhLPXCYEI2C8goZ5CRRacxXGSIx
         KYbtWk0W+xh/PaAWycIJcdgJ05NGMjBHeOVVIPss3Ik4EAh5xPEpgX0p9Kx3FqhIDK8S
         PyfXXWCPyTZvNxqH3ja/W9mz1aVHaY7c9vhT0Ot+pNeNDLn8gQxvDpXpXMAmOnJMp/PT
         TKZxUd9TmcCwRmLos4F6RcWFvAykBiRxJqDjginQfzUc3yiD5tv6wngH0u7ZleCKQ9Ko
         UaHjqqdIu6FkC5PXztHWPedL1S+5t434qmNmNz9/j1kI2MYwZ927zn46C5LxSM96H2et
         GZRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mEhyUZRTeqc69V/g+d49yqJOFhHnKBtmvBDRVm8lrYo=;
        b=eO+/K+XRq9FqHyQ4KNIhYKDiK/B3CPlZ+tCyi3yBFOZ5RzEx81dVm2eq4xTh/WP4tO
         zdk142CWoj8iQhVNiIBzKWgrJw364YFyflWw7BuAgUJdN1BL1GZ8s5CcEhdbPKyA6RZk
         I+ikuHoZizSSmyqiIFavSqL4J+iQQdXZvKu8a/2JSQdUspwbBS83aIr7ywHI9XVlE5KG
         PHQ6R5g0Jr1P2Pym8mAFGVHUo7wzNiNlMgEcZLbMizGur9uH0cWRGiR/ep5HPc1U3bj9
         QySa64q787h4jd9DptaZxTQMKabwQJ3bIpiIvtg7eqjrwBQYN/53pkqPRkeewfwaMHaM
         SzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mEhyUZRTeqc69V/g+d49yqJOFhHnKBtmvBDRVm8lrYo=;
        b=FEzLUtGhUhVlTMEnW2J5B+FQFwnCQYbUrJ0obRc8RaFcGJ/StP1xRWp4GproStPEG9
         2oijngqUX9Mg0gxogqXKJFn0da/TIG6BGTuOuTevAG8Wl8v59aRTapZtiHbQrfsjmCep
         Fc0zSADrI/t1H+t9FZ/GTPimRi/npaEO0kJPPBdrF8vQXlJVFX1CIKDHLJ8nBHkwLQBq
         pcjvLBrN3qhBh5llwQj6fMa4OItansQPJUv11VpzHiQrQ5G0ArbRSB7zP7f7YQ0AMX0T
         TJR9auRKlI+1435Bf4pKZzalbRIdYoxBHbHECiSCXAl4ZU9b8SG14nT6yH6yC7SVa+EL
         kcEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YdNk8ttCY2b4oPH7CFey6Nawx/W7fWpOnEs0lfTn/aYxb89l+
	hB+X08wKrwK8l3aBRHe2vOA=
X-Google-Smtp-Source: ABdhPJwsIvH+N9VrgLWY7MNEZdoInb9BIVKDuSlx5WOd7wkCAs6v6sZnhGaSS9KJRKubOPiVvxLG7A==
X-Received: by 2002:ae9:f305:: with SMTP id p5mr2563610qkg.481.1603962767444;
        Thu, 29 Oct 2020 02:12:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1248:: with SMTP id a8ls1094019qkl.11.gmail; Thu,
 29 Oct 2020 02:12:46 -0700 (PDT)
X-Received: by 2002:a37:7e42:: with SMTP id z63mr2722095qkc.307.1603962766660;
        Thu, 29 Oct 2020 02:12:46 -0700 (PDT)
Date: Thu, 29 Oct 2020 02:12:45 -0700 (PDT)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d66e8b2f-e499-40d2-8257-4d93597bfff9n@googlegroups.com>
In-Reply-To: <bf532fea-eca9-1c8b-a814-682e34962332@siemens.com>
References: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
 <bf532fea-eca9-1c8b-a814-682e34962332@siemens.com>
Subject: Re: Jailhouse hang on NXP ls1046a ARM64 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_182_1885416797.1603962765888"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_182_1885416797.1603962765888
Content-Type: multipart/alternative; 
	boundary="----=_Part_183_2115161165.1603962765888"

------=_Part_183_2115161165.1603962765888
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan for your help. Now I have fixe the issue, the issue is from I=20
mapped the whole DCSR space together, after removing it and adding some=20
memeroy region of IPs,  now I run jailhouse enable without any errors.=20

One more questions, do we need to map memory regions of all the IPs in=20
SYSCONFIG?  or only IPs to be used in cells? thanks again.

Best Regards,
Peter P.

=E5=9C=A82020=E5=B9=B410=E6=9C=8828=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 =E4=B8=8B=E5=8D=886:43:10<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A

> On 28.10.20 11:06, Peter pan wrote:
> > Hello Jailhouse Community,
> >=20
> > I am trying to enable Jaihouse on NXP ls1046a platform which has four
> > ARM A72 CPU Cores, but now the system hangs after I execute "jailhouse
> > enable ls1046a.cell".
> >=20
> > root@localhost:~/jailhouse/jailhouse# jailhouse enable ls1046a.cell
> >=20
> > =20
> >=20
> > Initializing Jailhouse hypervisor v0.12 (73-gacdc9fcc-dirty) on CPU 2
> >=20
> > Code location: 0x0000ffffc0200800
> >=20
> > Page pool usage after early setup: mem 39/992, remap 0/131072
> >=20
> > Initializing processors:
> >=20
> >  CPU 2... OK
> >=20
> >  CPU 0... OK
> >=20
> >  CPU 1... OK
> >=20
> >  CPU 3... OK
> >=20
> > Initializing unit: irqchip
> >=20
> > Initializing unit: ARM SMMU v3
> >=20
> > Initializing unit: ARM SMMU
> >=20
> > No SMMU
> >=20
> > Initializing unit: PVU IOMMU
> >=20
> > Initializing unit: PCI
> >=20
> > Adding virtual PCI device 00:00.0 to cell "ls1046"
> >=20
> > Adding virtual PCI device 00:01.0 to cell "ls1046"
> >=20
> > Page pool usage after late setup: mem 62/992, remap 5/131072
> >=20
> > Activating hypervisor
> >=20
> > WARN: unknown SGI received 5
> >=20
> > WARN: unknown SGI received 5
> >=20
> > //Linux hang here.
> >=20
> > After did some debuging,  I found the issue is with the followng callin=
g.
> >=20
> > on_each_cpu(enter_hypervisor, header, 0);
> >=20
> > The following is definition of on_each_cpu.
> >=20
> > 611 void on_each_cpu(void (*func) (void *info), void *info, int wait)
> >=20
> > 612 {
> >=20
> > 613         unsigned long flags;
> >=20
> > 614
> >=20
> > 615         preempt_disable();
> >=20
> > 616         smp_call_function(func, info, wait);
> >=20
> > 617         local_irq_save(flags);
> >=20
> > 618         func(info);
> >=20
> > //Can panic here if call panic("return from hypervisor\n");
> >=20
> > 619         local_irq_restore(flags); =20
> >=20
> > //System hang and can't panic here if call panic("return from
> > hypervisor\n"); =20
> >=20
> > 620         preempt_enable();
> >=20
> > 621 }
> >=20
> > 622 EXPORT_SYMBOL(on_each_cpu);
> >=20
> > I found the system hangs just after execute  local_irq_restore(flags),
> > because the system can panic if I call panic() just before
> > local_irq_restore(), but can't panic if add panic() just after
> > local_irq_restore().
> >=20
> > I attached ls1046a.c.=20
> >=20
> > I am a newbies of Jailhouse,  how to debug such issue? any comments or
> > suggestion is Welcome, thanks.
> >=20
>
> Henning (in CC) did a lot of work on this platform, and IIRC one
> particular tricky issue was when the GIC was accidentally passed through
> rather than intercept (not mapped). That's probably worth to check again
> in your config.
>
> Reminds me that we need to enhance "jailhouse config check" in this
> regard...
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d66e8b2f-e499-40d2-8257-4d93597bfff9n%40googlegroups.com.

------=_Part_183_2115161165.1603962765888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jan for your help. Now I have fixe the issue, the issue is from I ma=
pped the whole DCSR space together, after removing it and adding some memer=
oy region of IPs,&nbsp; now I run jailhouse enable without any errors.&nbsp=
;<div><br></div><div>One more questions, do we need to map memory regions o=
f all the IPs in SYSCONFIG?&nbsp; or only IPs to be used in cells? thanks a=
gain.</div><div><br></div><div>Best Regards,</div><div>Peter P.<br><br></di=
v><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=
=A82020=E5=B9=B410=E6=9C=8828=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 =E4=
=B8=8B=E5=8D=886:43:10&lt;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 28.10.=
20 11:06, Peter pan wrote:
<br>&gt; Hello Jailhouse Community,
<br>&gt;=20
<br>&gt; I am trying to enable Jaihouse on NXP ls1046a platform which has f=
our
<br>&gt; ARM A72 CPU Cores, but now the system hangs after I execute &quot;=
jailhouse
<br>&gt; enable ls1046a.cell&quot;.
<br>&gt;=20
<br>&gt; root@localhost:~/jailhouse/jailhouse# jailhouse enable ls1046a.cel=
l
<br>&gt;=20
<br>&gt; =C2=A0
<br>&gt;=20
<br>&gt; Initializing Jailhouse hypervisor v0.12 (73-gacdc9fcc-dirty) on CP=
U 2
<br>&gt;=20
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt;=20
<br>&gt; Page pool usage after early setup: mem 39/992, remap 0/131072
<br>&gt;=20
<br>&gt; Initializing processors:
<br>&gt;=20
<br>&gt; =C2=A0CPU 2... OK
<br>&gt;=20
<br>&gt; =C2=A0CPU 0... OK
<br>&gt;=20
<br>&gt; =C2=A0CPU 1... OK
<br>&gt;=20
<br>&gt; =C2=A0CPU 3... OK
<br>&gt;=20
<br>&gt; Initializing unit: irqchip
<br>&gt;=20
<br>&gt; Initializing unit: ARM SMMU v3
<br>&gt;=20
<br>&gt; Initializing unit: ARM SMMU
<br>&gt;=20
<br>&gt; No SMMU
<br>&gt;=20
<br>&gt; Initializing unit: PVU IOMMU
<br>&gt;=20
<br>&gt; Initializing unit: PCI
<br>&gt;=20
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;ls1046&quot;
<br>&gt;=20
<br>&gt; Adding virtual PCI device 00:01.0 to cell &quot;ls1046&quot;
<br>&gt;=20
<br>&gt; Page pool usage after late setup: mem 62/992, remap 5/131072
<br>&gt;=20
<br>&gt; Activating hypervisor
<br>&gt;=20
<br>&gt; WARN: unknown SGI received 5
<br>&gt;=20
<br>&gt; WARN: unknown SGI received 5
<br>&gt;=20
<br>&gt; //Linux hang here.
<br>&gt;=20
<br>&gt; After did some debuging,=C2=A0 I found the issue is with the follo=
wng calling.
<br>&gt;=20
<br>&gt; on_each_cpu(enter_hypervisor, header, 0);
<br>&gt;=20
<br>&gt; The following is definition of on_each_cpu.
<br>&gt;=20
<br>&gt; 611 void on_each_cpu(void (*func) (void *info), void *info, int wa=
it)
<br>&gt;=20
<br>&gt; 612 {
<br>&gt;=20
<br>&gt; 613=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
<br>&gt;=20
<br>&gt; 614
<br>&gt;=20
<br>&gt; 615=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_disable();
<br>&gt;=20
<br>&gt; 616=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0smp_call_function(func, info,=
 wait);
<br>&gt;=20
<br>&gt; 617=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
<br>&gt;=20
<br>&gt; 618=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func(info);
<br>&gt;=20
<br>&gt; //Can panic here if call panic(&quot;return from hypervisor\n&quot=
;);
<br>&gt;=20
<br>&gt; 619=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_restore(flags);=C2=
=A0=C2=A0
<br>&gt;=20
<br>&gt; //System hang and can&#39;t panic here if call panic(&quot;return =
from
<br>&gt; hypervisor\n&quot;);=C2=A0=C2=A0
<br>&gt;=20
<br>&gt; 620=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_enable();
<br>&gt;=20
<br>&gt; 621 }
<br>&gt;=20
<br>&gt; 622 EXPORT_SYMBOL(on_each_cpu);
<br>&gt;=20
<br>&gt; I found the system hangs just after execute=C2=A0 local_irq_restor=
e(flags),
<br>&gt; because the system can panic if I call panic() just before
<br>&gt; local_irq_restore(), but can&#39;t panic if add panic() just after
<br>&gt; local_irq_restore().
<br>&gt;=20
<br>&gt; I attached ls1046a.c.=C2=A0
<br>&gt;=20
<br>&gt; I am a=C2=A0newbies of Jailhouse,=C2=A0 how to debug such issue? a=
ny comments or
<br>&gt; suggestion is Welcome, thanks.
<br>&gt;=20
<br>
<br>Henning (in CC) did a lot of work on this platform, and IIRC one
<br>particular tricky issue was when the GIC was accidentally passed throug=
h
<br>rather than intercept (not mapped). That&#39;s probably worth to check =
again
<br>in your config.
<br>
<br>Reminds me that we need to enhance &quot;jailhouse config check&quot; i=
n this
<br>regard...
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d66e8b2f-e499-40d2-8257-4d93597bfff9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d66e8b2f-e499-40d2-8257-4d93597bfff9n%40googlegroups.co=
m</a>.<br />

------=_Part_183_2115161165.1603962765888--

------=_Part_182_1885416797.1603962765888--
