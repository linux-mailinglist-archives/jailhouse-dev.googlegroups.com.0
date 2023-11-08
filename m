Return-Path: <jailhouse-dev+bncBC4YHVHNQYHBB75OVSVAMGQEE2MK4GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3a.google.com (mail-oa1-x3a.google.com [IPv6:2001:4860:4864:20::3a])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE397E4FD4
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Nov 2023 06:07:13 +0100 (CET)
Received: by mail-oa1-x3a.google.com with SMTP id 586e51a60fabf-1ef4f8d26d2sf8539819fac.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Nov 2023 21:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699420032; x=1700024832; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lumJzOnBAU0hGR8SiJA6hvtN40Vu41+YeESwv3eNgBQ=;
        b=ncsMuNJnT0M8djrbC9JhkTSL+trsQ6whjHsCLyTpjKhS7poV8wGtu8RtycMBFYa931
         sscb2fePt/WBMcOzdt4xbd+Z45qDzpEgw2F6BNRca1GYyIMLu1XaN6Md3J0/vNgVMri5
         jkmB88kMJSJnu1CWgHJRslN9NDDdeQ1rgXWfwyN2K19f4ktIXp+cUv5rQ9gD9JMLdJMd
         0pnkyI8gay6/FVmIx6YEktdMB4CAS3uTCVPFxyeF9hLsBFJ3P8TfScOnLOcn8tlPwW/o
         mbM8/wGNLFUpsAlmItx8FoKsfWGFYrKw16g0w4gbjkpjL89EynK7mvusL27MZYUDNE8x
         iTvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups-com.20230601.gappssmtp.com; s=20230601; t=1699420032; x=1700024832; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lumJzOnBAU0hGR8SiJA6hvtN40Vu41+YeESwv3eNgBQ=;
        b=aNMfc3L+Ag3B0r6YojNAHJtXgr2jtBgW9RJGAB8jz6Mx/pH5Wm86QCdJGkEtPoyaeD
         Yk5L+IlymCFoxc6b9fhGqa4lX4p+Er6iW0aTJN5bxB+2fDiWGGtdxe5aRU1FOdQS3u30
         b/dghbCDOG2FkSEHNjyVvqm1xVQidAPmzI3pshEZdEMwKyXcV/MR/o3E7loPTM+QPFQM
         GXF/n13+YEOe5tf+6fMs7bDXeEW7h7CWcv2tS2Nz1axQF5/5WTgbP8kO1PCDUjiFcBDH
         nR4yygHrKgsaYoKiiUedUVLuvbqESV5A4zvKgE+GW78GpXOr9xmFNoQvLBsqmxuPL+td
         mj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699420032; x=1700024832;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lumJzOnBAU0hGR8SiJA6hvtN40Vu41+YeESwv3eNgBQ=;
        b=qbBdRpPO4Zw+GVThwulSZg1HEBirzelI/ttLWq/Ybad/mS79tIxYse/zH1EiU96shQ
         ZJKVLlJq/NJvxcOJ/oKXLNNugiDgd4Zj0+qPU6TtG16KOzfdHv8k8uTtC07VO3UJA90N
         nuYbaFLtk3N/zKq7HZgxEPb0o5STX2M2j1KuJWsDMMl9ymv5LAvWIpaORIKk8NvGUYIL
         e1d+diL7QQ+AweRc4Re0xXlG8d5M89lgkpNbAihgAM3b35xmP0UjL2iRuzxD9yIXYySJ
         KoUp92XRG5w6zcH6N7eqD9VwWhKBaQBDw36SqGSviWpeJOYl/HnC86Tup5axuWGddYdw
         QEBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxsVcpxCC5EJP9Sqqgmb3JgWL2WBC41Il9egM8OA//8qoWkLd/a
	uXXNQv8KimT+vkRG3ba/Kbg=
X-Google-Smtp-Source: AGHT+IEoN+9VEzOH22J6KXojPrxi/q80vD9vDlW73++RRBAvbpJwYA7mo2kI9/jAA3v11tySPzQ+7Q==
X-Received: by 2002:a05:6870:1394:b0:1e9:b2e2:8754 with SMTP id 20-20020a056870139400b001e9b2e28754mr709851oas.2.1699420031899;
        Tue, 07 Nov 2023 21:07:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:3b1a:b0:1d1:3283:6299 with SMTP id
 gh26-20020a0568703b1a00b001d132836299ls1518507oab.1.-pod-prod-00-us; Tue, 07
 Nov 2023 21:07:11 -0800 (PST)
X-Received: by 2002:a05:6808:1788:b0:3a1:c163:6022 with SMTP id bg8-20020a056808178800b003a1c1636022mr346934oib.4.1699420030940;
        Tue, 07 Nov 2023 21:07:10 -0800 (PST)
Date: Tue, 7 Nov 2023 21:07:10 -0800 (PST)
From: Veerapandiyan V <v.pandiyan@blackpeppertech.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <24836639-c565-4576-874e-726bdee8dcb9n@googlegroups.com>
Subject: dot cell file
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_121846_1521659710.1699420030256"
X-Original-Sender: v.pandiyan@blackpeppertech.com
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

------=_Part_121846_1521659710.1699420030256
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,
            How to edit dot cell file. I want to blink led code.
Thanks Regards,
 Veerapandiyan V.

-- 









Important Note: This e-mail may contain IP, trade secrets or 
privileged, undisclosed or otherwise confidential information. If you have 
received this e-mail by error, you are hereby notified that any review, 
copying or distribution of it is strictly prohibited. Please inform us 
immediately(info@blackpeppertech.com <mailto:info@blackpeppertech.com>) and 
destroy the original transmittal. Thank you for your cooperation.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/24836639-c565-4576-874e-726bdee8dcb9n%40googlegroups.com.

------=_Part_121846_1521659710.1699420030256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Everyone,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 How to edit dot cell file. I want to blink led code.<=
/div><div>Thanks Regards,</div><div>=C2=A0Veerapandiyan V.<br /></div>
<br>
<p><font face=3D""></font><p><font face=3D""><font size=3D"3">

<font face=3D""><font size=3D"3">

<br><font face=3D""><span style=3D"color:rgb(31,73,125)"><font size=3D"3">I=
mportant Note: This e-mail may contain IP, trade secrets or privileged, und=
isclosed or otherwise confidential information. If you have received this e=
-mail by error, you are hereby notified that any review, copying or distrib=
ution of it is strictly prohibited. Please inform us immediately(</font><a =
href=3D"mailto:info@blackpeppertech.com" target=3D"_blank"><font size=3D"3"=
><em>info@<wbr>blackpeppertech.com</em></font></a><font size=3D"3">) and de=
stroy the original transmittal. Thank you for your cooperation.</font></spa=
n></font></font></font></font></font></p></p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/24836639-c565-4576-874e-726bdee8dcb9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/24836639-c565-4576-874e-726bdee8dcb9n%40googlegroups.co=
m</a>.<br />

------=_Part_121846_1521659710.1699420030256--
