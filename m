Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBAFZ4PWQKGQEBLB5XOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9CE942B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 01:42:42 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id 67sf312975oid.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Oct 2019 17:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uFV+wcApayCu69OLNxrm5CyugBE3DC8L4PZXTmfavBU=;
        b=mWoTmxT2HMrKrJBtUaUcNrGLNjhuNei+Bv/V9ImS0H5dus58e/bKsuHTXEJa1cJzM2
         r6hIKKod+LivKXxFmJHNNtCcVkUvMwhRDyLAnAHQ1+0BOBw6hbdS/kwk8JE4j/6WLlWy
         uRFbeCib/sKZwpdyhx8zOtRaw/ja+OCVI0j0lIfYuIiwR8IHpPae1sSZ/vY27mCBX04y
         8k7q5xvndZBbJw8f+C28u/a5QC0blYiRuHBw2WEbEPTi/ldUjQMbxaqHjOyXLZ72hoSY
         HQLTFPL5irJD//BxozWaI4Ckf2Q+plklBcqL4GuCSMdDqU9zJcvbqWE5KaGBFrNC3EF+
         DYrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uFV+wcApayCu69OLNxrm5CyugBE3DC8L4PZXTmfavBU=;
        b=Izje/9OwC1mXZwLSyO9+MW13IBYgY8XwIYuMTaO+nbtI5HuaOR0ov1JZENEUkyyL7z
         Do4q6+g/FU+w6c7fDsJrBNSPFUwe95mu5UCxrPC1dorFmMALrwZrSSUmkZzdS0sk9xX9
         qy2vPVJiEvXFGxuY/xtWaPy8wkwB6kXGrEal85NjtSLAVjNYa3rN6jvcNS0p7Jl2cOkw
         +fpvWOx39LSbQFMpLaxcs6DU2wdzhfcHv493D37rjoKTOOYk9cay55818wXFjeku2KyG
         aE9l6lBaX0HqOy3KvHL5Y2AeS6nBnA/FJmzc1iW5d+EvFOecEdf5pV45XEY5AajmwKi4
         +egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uFV+wcApayCu69OLNxrm5CyugBE3DC8L4PZXTmfavBU=;
        b=Zgz6Q/d7izcGCu8aL9RbmJTog9o1vm6KEfdGO3mb4zh5cNicnu2bXxHcGO8uEkPoaY
         Kpd+37Q0h2lNH8ZIZ0HFpFzghtfdzYAe5lBkAmJKXA5f+eEGtUlXLofADKOrfToQyriU
         4iw88dNyID+ebAAyu8P18yPFNYci/gHmubXnLJj1Y43ArrlxsCSsk4vooTiMsmw6pfGe
         WaNOQ+TwESKKPy+gBLjRRptjzNaYA0n2qNrJWIqWRl3NU2v8cgBxbQlol3d4HMrOd9Vk
         UDGImTJQD5z00p9TR0VOBdQLFpMZUi7avCa/Z/2phNxu48/DVNNC2/YZFYydjAQpFUo7
         knVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlHjDWYw7DfUI1azufcGzr7l/HB0uCg2FH8S3DztH927DVj4Ai
	b8jHmNic+nw+CXSw5Pi51JI=
X-Google-Smtp-Source: APXvYqzpaTRPoMr1qZ+4X+QO4xJIaEWIx5LOLR39ln0DCCfguhNthUte92kjIKUKq04JOlUPxC/cWg==
X-Received: by 2002:aca:5413:: with SMTP id i19mr6698750oib.121.1572396160737;
        Tue, 29 Oct 2019 17:42:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:438a:: with SMTP id u10ls5041119oiv.3.gmail; Tue, 29 Oct
 2019 17:42:39 -0700 (PDT)
X-Received: by 2002:a05:6808:291:: with SMTP id z17mr6710804oic.174.1572396159762;
        Tue, 29 Oct 2019 17:42:39 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:42:39 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8aa82f84-ee18-4f6f-8d24-906528c5edcb@googlegroups.com>
In-Reply-To: <c03e237a-78c1-4169-9d2d-104e34754cd2@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <c03e237a-78c1-4169-9d2d-104e34754cd2@googlegroups.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2023_379114433.1572396159245"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_2023_379114433.1572396159245
Content-Type: multipart/alternative; 
	boundary="----=_Part_2024_937940673.1572396159246"

------=_Part_2024_937940673.1572396159246
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2019=E5=B9=B410=E6=9C=8826=E6=97=A5=E5=9C=9F=E6=9B=9C=E6=97=A5 18=E6=99=822=
6=E5=88=8657=E7=A7=92 UTC+9 michael...@gmail.com:
>
> Hi all,
>
> I'm not sure if this is relevant in this case, but I have noticed that on=
=20
> Intel x86-64, if hardware p-states (HWP) are enabled in the CPU (which th=
ey=20
> are by default if the CPU supports it), this introduces frequency scaling=
=20
> coupling between cores, even when the cores are isolated in separate cell=
s.=20
> So you get this unexpected behavior where an inmate with 1 core will run=
=20
> *faster* if the other cores are very busy, and run a lot slower if the=20
> other cores are all idle. This is because the CPU itself does the frequen=
cy=20
> scaling automatically in hardware and doesn't know anything about what=20
> Jailhouse is doing.
>
> Passing intel_pstate=3Dno_hwp to the Linux kernel command line disables=
=20
> hardware p-states and gets rid of this coupling as far as I can tell. It=
=20
> appears that HWP is a relatively new feature (last couple of years) in=20
> Intel CPUs.
>

This looks like a possibility.

I did discovered that cores changing C-state in Root Cell can cause RTOS to=
=20
become slower.
We had some disscussion a couple month before, I think.

Currently, I have disabled all the C-state, but not P-state.
Maybe the driver kicked in after I got a newer kernel?

I will check.
=20

>
> -Michael
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8aa82f84-ee18-4f6f-8d24-906528c5edcb%40googlegroups.com.

------=_Part_2024_937940673.1572396159246
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>2019=E5=B9=B410=E6=9C=8826=E6=97=A5=E5=9C=9F=E6=9B=
=9C=E6=97=A5 18=E6=99=8226=E5=88=8657=E7=A7=92 UTC+9 michael...@gmail.com:<=
blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bord=
er-left: 1px #ccc solid;padding-left: 1ex;"><div dir=3D"ltr">Hi all,<div><b=
r></div><div>I&#39;m not sure if this is relevant in this case, but I have =
noticed that on Intel x86-64, if hardware p-states (HWP) are enabled in the=
 CPU (which they are by default if the CPU supports it), this introduces fr=
equency scaling coupling between cores, even when the cores are isolated in=
 separate cells. So you get this unexpected behavior where an inmate with 1=
 core will run <i>faster</i>=C2=A0if the other cores are very busy, and run=
 a lot slower if the other cores are all idle. This is because the CPU itse=
lf does the frequency scaling automatically in hardware and doesn&#39;t kno=
w anything about what Jailhouse is doing.</div><div><br></div><div>Passing =
<font face=3D"courier new, monospace">intel_pstate=3Dno_hwp=C2=A0</font>to =
the Linux kernel command line disables hardware p-states and gets rid of th=
is coupling as far as I can tell. It appears that HWP is a relatively new f=
eature (last couple of years) in Intel CPUs.</div></div></blockquote><div><=
br></div><div>This looks like a possibility.</div><div><br></div><div>I did=
 discovered that cores changing C-state in Root Cell can cause RTOS to beco=
me slower.</div><div>We had some disscussion a couple month before, I think=
.</div><div><br></div><div>Currently, I have disabled all the C-state, but =
not P-state.</div><div>Maybe the driver kicked in after I got a newer kerne=
l?</div><div><br></div><div>I will check.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-lef=
t: 1px #ccc solid;padding-left: 1ex;"><div dir=3D"ltr"><div><br></div><div>=
-Michael</div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8aa82f84-ee18-4f6f-8d24-906528c5edcb%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/8aa82f84-ee18-4f6f-8d24-906528c5edcb%40googlegroups.com<=
/a>.<br />

------=_Part_2024_937940673.1572396159246--

------=_Part_2023_379114433.1572396159245--
