Return-Path: <jailhouse-dev+bncBCDJXM4674ERBKUFUD2AKGQEVIFKCZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7580519E291
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Apr 2020 05:44:43 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id 61sf8863358otw.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Apr 2020 20:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3pW+eOVl45OLeNf2bPUNcxFRlIrsVZQpkPZCxRpRWjw=;
        b=ZYfALAV5CWgFy5uwduqCobrd2d/fvFmk+4Tzce0aIi313JCniqxuBa1cn/VGdoQG/m
         AiRJSBYk1E7k85gP9Padn01U5HsnMH5GrqyzHo/aIgpg54TbQLYypIYWbPzP618SpIHs
         99DyIF+h72LNHrtuqnr5XQRaLNnEMZRqzPrVqsvZLPagnrBYpxjAVHYXritWI5iNUWe+
         kvSCUT2sakkdNvGym8YawNO3mY1b0caz9pv16Ka093y6CkiWZ9v/F7b4txabaKnauhNS
         KLW4XncsQhj7z/HJJYPhvRmhuVaBQC71E5yq9/oyH3p3CJn3/TfRy5yp5qMDXlX7pDUc
         QTtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3pW+eOVl45OLeNf2bPUNcxFRlIrsVZQpkPZCxRpRWjw=;
        b=Om6hVhJD9qdxmxmo5ej1mg74xTpGVu5K9WgtUNnSN/1VWl3zvdwYB6xHOq9KxwNr0E
         PsVQjeplWzeA/IiduSVKYsU4wi6+Yi1zcwDsun6sDJXF7orTETrkwvBdCOba4aPOAGm8
         EDaeB28kWnLX4C6V/IK9THJYBvIs95t/0O/ZlIfEUQTvgJiUe7xoaAjnUkHPSF5+Nb5e
         d2DR39sv2myu/ECAzKiC4o5xzmrV17cKV/L6Ic0IAGwafdreDH+B9Ln9gsJ0+OkzPK6x
         q1QB0AxD8xq2hbMyJs5lIAX2IzqiG1P2o331y71c9NHYwGJhGgLxRdKURgCfjWuK5d+g
         kong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3pW+eOVl45OLeNf2bPUNcxFRlIrsVZQpkPZCxRpRWjw=;
        b=kK4HDLnDx3Gp2p0mL+P8SDpjRfjGcm9LHj1XIATN1YbIwDn8nVQ4JmdU0TScHOHL5m
         Z1U4bONqPaRUX2CBLm8rVh76Z7X0WnAjlcDTGlEHTTrFC/dN2N5/qrFFKOQb1obWk0qe
         DIuAWxXoTVXkIAacbM04ZV7bbbDjbGMtObI4166sKqjqMnJXCrIIcTRghuJ5zGM1S+0B
         h+XaIJJVeOq4Dy2HlvRgXDf0FqlbH/WvfmmmALoxIi0w8+xtKgE8gF4YiTnDaprK3Mqr
         vLHQpatao+J+B99saGT6vVVa+NSjFtVPqcHWH5cRGLFuQldItb27xrQnDkbCEczaBtG5
         jZag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuY/W1BZ2+JcYarcEXSJcLwzSjIJ2YqqJKnKf4QcJBRvcrtitifw
	AaxiwQz7T6wCgMlmpRwWSS8=
X-Google-Smtp-Source: APiQypIBS0n+XTURCmc134UnZ4xPKWbqWNoMpEJykJkwMaMXrPUHmiBqcXITiBhkTIDve8Xbea6vOA==
X-Received: by 2002:aca:5652:: with SMTP id k79mr5526613oib.15.1585971882443;
        Fri, 03 Apr 2020 20:44:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c38f:: with SMTP id t137ls4738938oif.6.gmail; Fri, 03
 Apr 2020 20:44:42 -0700 (PDT)
X-Received: by 2002:aca:af12:: with SMTP id y18mr5252020oie.78.1585971881818;
        Fri, 03 Apr 2020 20:44:41 -0700 (PDT)
Date: Fri, 3 Apr 2020 20:44:41 -0700 (PDT)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03@googlegroups.com>
Subject: Questions about x86 P-states during CPU handoff from root to inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1079_595932349.1585971881107"
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

------=_Part_1079_595932349.1585971881107
Content-Type: multipart/alternative; 
	boundary="----=_Part_1080_457388532.1585971881107"

------=_Part_1080_457388532.1585971881107
Content-Type: text/plain; charset="UTF-8"

Hello,

I currently have a very simple application (no RTOS) running on a 
single-core x86 inmate that is unaware of P-states. I am also running with 
Hardware P-states (HWP) disabled on the Linux command line. When the root 
cell gives control of the core over to the inmate, it's unclear to me what 
happens to the P-state of that core. If it has an idle P-state, and then is 
handed off to inmate, will it still be at the same P-state? Or will it get 
reset to the full-throttle P0 P-state?

In my testing, my inmate appears to be running full throttle at the base 
frequency, meaning that the P-state gets reset to P0 somehow. But I'm not 
sure how to verify this beyond calculating the frequency with aperf and 
mperf, which I'm doing.

I guess I could dive into the Linux source code to see what the 
intel_pstate driver is doing, but I am a bit nervous that I might not 
understand it. So I'm hoping someone here knows how this handoff works. 
Maybe there is some kind of watchdog timer that needs to be actively reset 
by the intel_pstate driver to keep a core at a P-state other than P0.

Thanks,
Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03%40googlegroups.com.

------=_Part_1080_457388532.1585971881107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I currently have a very simple a=
pplication (no RTOS) running on a single-core x86 inmate that is unaware of=
 P-states. I am also running with Hardware P-states (HWP) disabled on the L=
inux command line. When the root cell gives control of the core over to the=
 inmate, it&#39;s unclear to me what happens to the P-state of that core. I=
f it has an idle P-state, and then is handed off to inmate, will it still b=
e at the same P-state? Or will it get reset to the full-throttle P0 P-state=
?</div><div><br></div><div>In my testing, my inmate appears to be running f=
ull throttle at the base frequency, meaning that the P-state gets reset to =
P0 somehow. But I&#39;m not sure how to verify this beyond calculating the =
frequency with aperf and mperf, which I&#39;m doing.</div><div><br></div><d=
iv>I guess I could dive into the Linux source code to see what the intel_ps=
tate driver is doing, but I am a bit nervous that I might not understand it=
. So I&#39;m hoping someone here knows how this handoff works. Maybe there =
is some kind of watchdog timer that needs to be actively reset by the intel=
_pstate driver to keep a core at a P-state other than P0.<br></div><div><br=
></div><div>Thanks,</div><div>Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03%40googlegroups.com<=
/a>.<br />

------=_Part_1080_457388532.1585971881107--

------=_Part_1079_595932349.1585971881107--
