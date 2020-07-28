Return-Path: <jailhouse-dev+bncBDCYL2P744ARB5XBQD4QKGQEVEB6B7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF79230C02
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 16:06:48 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id a130sf13070917qkg.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gAC2/HZPvKTjAzWMLv64Tcz6tLEu3gCUL0ml955BD6U=;
        b=l7JWbzOXi4RVLnmodj37jcuk5Xz1r21uWXkwEQhcmrvuCl84SS426AdU2UJlaMyQhK
         92ChU4Z1vWOfM7jLFu3tlVE5HY2LBaA3fKVNrE7bw1dTLHNELJZF+iQhROkwvNpbpHtx
         2JKHJ0TwXAAkyo99rR/VIiIbwE22fu8MByod0OD9DfVgtC0S4B035+zbHxIAIDejbnCt
         QnCpPMOLa5DEF80kkzdStAr7QmtG4W896tsTSc3ebOQaege8fuyDFhRA+ega3H6bFNnX
         V0d1YOH5AkPUendvVDqKcSNzqx+ZulppWbPIyLbhoyUMeKJqHcePyeYDJVh/VhsQS6z3
         AXmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gAC2/HZPvKTjAzWMLv64Tcz6tLEu3gCUL0ml955BD6U=;
        b=MYe9u9fT+SJxEB8M81sTot71EHyPapJQS4yc+t+aNurnzMRc/6KgKR54LJ7cjGYeZg
         EVKOeSPlz/uY6hMXm4eKXZzsa2ggDqr99susbLd1crkAZMTRb45mFu8ADdTyxpEfTTvz
         uEt0jUkN/GsvuomUbiQKomOjeENXvvp8xkGuBaY7rIUYy8ZinAtPiVo/fP7PY4oOljYW
         OFXwJ8PI/4yiGGv05Ma7eGyOtwn8PZo/XIMfke3kCGAe6eK/+xTUqc17PNfBxetAh8lD
         x8ikA3wf/AP8tvGpSMPDEFvOeE84kt8srdbOoAg/u0NsMUwr6CjwwqjFnCOrqAqgJoGp
         NrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gAC2/HZPvKTjAzWMLv64Tcz6tLEu3gCUL0ml955BD6U=;
        b=NoF39vyXF+QhfUyKTcju+iy1SsFv2e7oFvSWqUFe+qN+lSLsuw76zYJ7vEBpHVdtNF
         XvUpJrhveyNSHxQKWKXyR4IPhgbGQkAylbVnPabs/vTaunn0XWcpcb7BMtVi6dpoOhCi
         /e7OnZDEhbfj85cOSSWG0qfOyOOpe4jBYCcwEr7WN1lJZbUO1fDQxXM7h493lDGV3urG
         VcZDXzo6jnkEjr/l2rZkpsnYxMl+mylnVZcLrb9ltG78HL2SyqrcOeiLDpRXFoUKYapj
         NCPTG+3DWAe4uZuLTguI81vI1Gfwoubw7xejDXspMjqRYro+BcfbMqUSB8HtzL7ji6I1
         eyFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dZeMpYGQwbXs6KYvQ036QTaaX6bJDqYdti/Ttvtj96co/8qia
	uu7Zs5tAoOI5OMtavFWgkqI=
X-Google-Smtp-Source: ABdhPJz+unn4/GGDOmDQ+w5k7j7YqZfC6Rw1qWILk81tafq9Uupsl7UJzG2KnMcEac9NfUJz8EQMQA==
X-Received: by 2002:aed:27cf:: with SMTP id m15mr27294785qtg.150.1595945207180;
        Tue, 28 Jul 2020 07:06:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4981:: with SMTP id w123ls9750773qka.9.gmail; Tue, 28
 Jul 2020 07:06:46 -0700 (PDT)
X-Received: by 2002:a37:a6c6:: with SMTP id p189mr17921986qke.386.1595945206310;
        Tue, 28 Jul 2020 07:06:46 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:06:45 -0700 (PDT)
From: mail.to.rui@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <150f6988-6b93-487a-80cf-0050dbe46381o@googlegroups.com>
Subject: Jailhouse + Intel NUC & serial port
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1072_532296385.1595945205496"
X-Original-Sender: mail.to.rui@gmail.com
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

------=_Part_1072_532296385.1595945205496
Content-Type: multipart/alternative; 
	boundary="----=_Part_1073_1599577137.1595945205496"

------=_Part_1073_1599577137.1595945205496
Content-Type: text/plain; charset="UTF-8"

Hello,

I was not able to follow Jailhouse development for some time now. Maybe 
someone can clarify me with this two doubts:

#1 - Is Jailhouse still using the serial port for outputting messages etc ? 
If so, and if you are using computers without serial port, how are you 
overcoming this? 

#2 - Does anyone have any kind of experience/feedback on running Jailhouse 
on Intel NUC (10th gen) ? Everything working has it should?


Thank you


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/150f6988-6b93-487a-80cf-0050dbe46381o%40googlegroups.com.

------=_Part_1073_1599577137.1595945205496
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I was not able to fol=
low Jailhouse development for some time now. Maybe someone can clarify me w=
ith this two doubts:</div><div><br></div><div>#1 - Is Jailhouse still using=
 the serial port for outputting messages etc ? If so, and if you are using =
computers without serial port, how are you overcoming this?=C2=A0</div><div=
><br></div><div>#2 - Does anyone have any kind of experience/feedback on ru=
nning Jailhouse on Intel NUC (10th gen) ? Everything working has it should?=
</div><div><br></div><div><br></div><div>Thank you</div><div><br></div><div=
><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/150f6988-6b93-487a-80cf-0050dbe46381o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/150f6988-6b93-487a-80cf-0050dbe46381o%40googlegroups.co=
m</a>.<br />

------=_Part_1073_1599577137.1595945205496--

------=_Part_1072_532296385.1595945205496--
