Return-Path: <jailhouse-dev+bncBCDJXM4674ERBL7ZWTYQKGQELYFMU7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0C14997E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 08:16:00 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id t10sf3938772otc.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 25 Jan 2020 23:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oXKhhGt477ympL3oQeGP27WV4JL8kR/Y6xWDOTEpk9c=;
        b=SSkuyNunumuCRHIbAbBBs8Tk+wgOFdM+IEHqaobZopQ/x9dpt3XLMAibN/cPqJ67ec
         qmPRYsVsTi4TU6DVsXdktbtU2y2U1MTnwObYnXRkU5Nunw4f48V3+DbQqPS8b1RdNRV/
         tLEtORA55cSs/t+qKd0BeQ5vQ925PrhgjwSU90mIVO5ulIJ5FJy+JFOS/EhFXNxmY7D2
         A1Q2vfcRYHL8SB20mRf5dXaZ7Knawho02zu/JJAhE65V5M4f8MXh+Ehl0jPRlOsblEH5
         ckDU0GTNUFQ2L8UOL4zEUXPDYKC7bhA04p42Wyeh0voT2mNMcSsdyQJGRGsOu7YHTAr1
         kBrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oXKhhGt477ympL3oQeGP27WV4JL8kR/Y6xWDOTEpk9c=;
        b=AYN9QaOKeghpr4c0Mc4DWg7HIEK/rdBabGjrxjbEe+0TE8cA/IVFYEFtziP2T2OmdF
         gNszo8nFpb3V6tI5Jc1CHlRMLyA/Va9GoBNL+NUj/1XMIkbHUX+We82XHiNX6FEAA3wC
         HZHsgAf728imAxpjzE1TePLUuCocrfdyMHkxEztIviJdQ5+OvAE1+cePasbWYXHYA8HJ
         ZzieOXMGmA9+XXDmmcttCqyCQ4byDPpoLXUYo00PZ1o9hsXUoS9OIhAJ1Vc3q5exOh5e
         S/tT82mRduG8wZKh3YYGNW0JmZmvCorGYc7CNgWdjyKjGQeXIQEeotmSRQ6AKT+gQGUh
         I/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oXKhhGt477ympL3oQeGP27WV4JL8kR/Y6xWDOTEpk9c=;
        b=X9chRbbgPT7VobHQHyywKr+7Aidi6f3jDnuxC7mj0vXBdWNlAylJmMFUlkSg9f+tmA
         OaqDK7bHqilJn+jPar9kfnfx+TwtIN+Qbv4iWBhnLmPwVL+CZkyOtr+ohgxN5QR7/HTL
         c1cQfjsU6ARw2sch5vf4Z9Na2sySulbPjb6hA0xa0pWX0hRSen/DXPPJui7o/mfGevmr
         JqJH81dcr+a1Q5dO2dfJIvqruKCmJe1vjr8TtSCQHFOfLQxMheqX1/loRRjPChTfkMQ1
         kWwHhG7fLcI3XXFMBq0Z1v6OQMk0fQ6Oq1rXGizQZv4utY9tXC8RvRrWwpAftz9aA6gC
         hBsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHS1Ex6TqT6XlmxuB/TfPaGsJfjeTY9rRc3jwqK20MZU4wVZba
	FbOctiko6pkCq+BWr+7a720=
X-Google-Smtp-Source: APXvYqyB3Ro+Ee6xUE1lyfZcuVcIKruGlURnd9OXJw2b3NtBP+0Tf6HOqlAqxjrMHVXVWQDm82i/mQ==
X-Received: by 2002:aca:dc8b:: with SMTP id t133mr4316404oig.98.1580022959713;
        Sat, 25 Jan 2020 23:15:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:895:: with SMTP id 143ls726490oii.1.gmail; Sat, 25 Jan
 2020 23:15:59 -0800 (PST)
X-Received: by 2002:aca:6144:: with SMTP id v65mr4331514oib.63.1580022959142;
        Sat, 25 Jan 2020 23:15:59 -0800 (PST)
Date: Sat, 25 Jan 2020 23:15:58 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a4b9be04-cd9e-4d96-b7d9-fcba0c2b18b4@googlegroups.com>
In-Reply-To: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_102_2118594334.1580022958607"
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

------=_Part_102_2118594334.1580022958607
Content-Type: multipart/alternative; 
	boundary="----=_Part_103_873236249.1580022958607"

------=_Part_103_873236249.1580022958607
Content-Type: text/plain; charset="UTF-8"

Another thing I could try is to 'pin' the Linux workload to the same core 
that the inmate uses using cpu affinity commands. Hopefully this will 
reduce variables (can you 'burn out' a core so that it runs slower than 
others? Seems unlikely, but maybe).

I also want to try getting an inmate cell running (maybe an actual Linux 
inmate this time) and see if the root cell workloads run the same. Maybe 
the presence of two loaded cells affects things somehow.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a4b9be04-cd9e-4d96-b7d9-fcba0c2b18b4%40googlegroups.com.

------=_Part_103_873236249.1580022958607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font color=3D"#000000" face=3D"Nunito, sans-serif"><span =
style=3D"font-size: 14.6667px; white-space: pre-wrap;">Another thing I coul=
d try is to &#39;pin&#39; the Linux workload to the same core that the inma=
te uses using cpu affinity commands. Hopefully this will reduce variables (=
can you &#39;burn out&#39; a core so that it runs slower than others? Seems=
 unlikely, but maybe).</span></font><div><span style=3D"font-size: 14.6667p=
x; white-space: pre-wrap; color: rgb(0, 0, 0); font-family: Nunito, sans-se=
rif;"><br></span></div><div><span style=3D"font-size: 14.6667px; white-spac=
e: pre-wrap; color: rgb(0, 0, 0); font-family: Nunito, sans-serif;">I also =
want to try getting an inmate cell running (maybe an actual Linux inmate th=
is time) and see if the root cell workloads run the same. Maybe the presenc=
e of two loaded cells affects things somehow.</span><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a4b9be04-cd9e-4d96-b7d9-fcba0c2b18b4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a4b9be04-cd9e-4d96-b7d9-fcba0c2b18b4%40googlegroups.com<=
/a>.<br />

------=_Part_103_873236249.1580022958607--

------=_Part_102_2118594334.1580022958607--
