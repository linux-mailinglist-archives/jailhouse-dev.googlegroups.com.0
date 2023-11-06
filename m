Return-Path: <jailhouse-dev+bncBDDLR4VP3AKRBWUQUOVAMGQE3EVTFDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC57E1F41
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Nov 2023 12:05:00 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id 46e09a7af769-6ce25ad9ef2sf5364638a34.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Nov 2023 03:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699268699; x=1699873499; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ98ehWi6zUvxa2qMVxXvLbE4mOvvIbI3xKWE/r0CUE=;
        b=w1pPNMztU0+4zS3wgkHmT9CDsUw6k7LNu93zmIy3oVEc5gJwP4dYR4MycH5/dxPAia
         TBz4y5i/rRUpR7tNi7LwVWJm/5Lze0o9VrEnRhVkE9xTmlUQ+OG4OSohZSzpK+YTlQaK
         eznz9e3kVJZ+bsKOUKR3YqFplnv1AKadspI6DiSCllAVJauS70rkRm+1OUGz7r1X03iP
         LY3IMf5F7G6635P/rJG5e5dwYaMmPAVerK3fjz6Ylqpawwq8YHanZOlR31+HAY914who
         17A8aSO5v0W62feTF2yO+7Lk6XvwwZlytBNtZHQkGV8GTLWAm7lIhIwpBrrs0AYm6clA
         OlbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699268699; x=1699873499; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ98ehWi6zUvxa2qMVxXvLbE4mOvvIbI3xKWE/r0CUE=;
        b=L4xT29mxi3YGGYjsy7gnegOjQ+z274bz961HWQaCY1if1487YqN2pO514J5mjkdioc
         ymVjhgJtb7yKWUwb2ycfXi/OILOeHUaftAG5bsn5FY50/MK0+PWZ3s8vXgAgBlWzsvyZ
         kqTA5ZwD7zDeiAk/EDwLcKdrRA1CSDpDzEb1rAd2ZPyBoMF5mIuQU80w2e9CF/dh22Ca
         xmYB+rxW7UZ56P7i0SXETGcfqrHw9fecKIXsxtBrLAJEglzRnIfyAMNkd0C2j868TCsk
         rzIAqscbDwGVYhgbChIDXCrNDiIdotaNiZjdmIcRwQBDCXqT9ydBov4GoKxOmbfJNRr6
         RMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268699; x=1699873499;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ98ehWi6zUvxa2qMVxXvLbE4mOvvIbI3xKWE/r0CUE=;
        b=NtKEef5Cs+BdE+27vcf2Cotn3Iy6MRk8SmOUpRcdok++pjqF9XrbPp89vhGB4Ofmma
         ddUZdmdH+MiHU6kGZ9oyhmnxAhQgdQcLBWzABK9vP800p2KwquGHZe7FF5+ausKjch41
         cIA6Ka7lf7lsPdK0Mg1tuPDGlphsKGB2nhHKAnfyKyHU8wd8vfrMYmm6eCpmF5UYPLem
         4sE/PL4TZptnU/yKl5wUaseBtmzY4sXCcLxcj6n0dzmMOaxU/Jt3F8in3xWx7eDly0rP
         YXZScJxaysHngM8kP89eaY0r9VuSr+K013c+eB0Ntb6r03g1e90OD0YpAM7YLfsFcvpx
         g9tg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzP79/H9FF1B3eHsYUC+Ypa7KIZUiMc2Buk1ofTkAZ8DpcmWUQC
	8XkKzJ02XnHgHLV69iC9n7E=
X-Google-Smtp-Source: AGHT+IE/7IVmxMa2Vc9xo1r9PQn7XYhrk0fZyCoxpWevGtfHHo2KdR9s2tpwZCrHE9BNDfPSGswi6g==
X-Received: by 2002:a05:6870:1810:b0:1e9:b3f6:12de with SMTP id t16-20020a056870181000b001e9b3f612demr29829491oaf.31.1699268699192;
        Mon, 06 Nov 2023 03:04:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:3b1a:b0:1d1:3283:6299 with SMTP id
 gh26-20020a0568703b1a00b001d132836299ls3593274oab.1.-pod-prod-00-us; Mon, 06
 Nov 2023 03:04:58 -0800 (PST)
X-Received: by 2002:a05:6871:647:b0:1e9:e1dd:b953 with SMTP id x7-20020a056871064700b001e9e1ddb953mr5572553oan.1.1699268698208;
        Mon, 06 Nov 2023 03:04:58 -0800 (PST)
Date: Mon, 6 Nov 2023 03:04:57 -0800 (PST)
From: Tony <antonydellerario@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <be611220-86a8-436a-8009-e50d6760e609n@googlegroups.com>
Subject: Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11807_886856692.1699268697417"
X-Original-Sender: antonydellerario@gmail.com
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

------=_Part_11807_886856692.1699268697417
Content-Type: multipart/alternative; 
	boundary="----=_Part_11808_769006558.1699268697417"

------=_Part_11808_769006558.1699268697417
Content-Type: text/plain; charset="UTF-8"

Hello everyone. 
I am trying to load a binary as a non-root cell of Jailhouse and run it on 
the Ultrascale ZCU104.  Within this binary there are serial prints executed 
via xil_printf that I do not see in output when I run the binary on 
jailhouse. I think because jailhouse does not support the libraries 
required by xil_printf, such as the printf libraries. In fact, the default 
demos (gic-demo and uart-demo) print via printk. How can I solve so that I 
can be able to see something output on the serial from my binary, without 
necessarily including the printk's within my binary? Thank you all in 
advance. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be611220-86a8-436a-8009-e50d6760e609n%40googlegroups.com.

------=_Part_11808_769006558.1699268697417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone. <br />I am trying to load a binary as a non-root cell of Ja=
ilhouse and run it on the Ultrascale ZCU104. =C2=A0Within this binary there=
 are serial prints executed via xil_printf that I do not see in output when=
 I run the binary on jailhouse. I think because jailhouse does not support =
the libraries required by xil_printf, such as the printf libraries. In fact=
, the default demos (gic-demo and uart-demo) print via printk. How can I so=
lve so that I can be able to see something output on the serial from my bin=
ary, without necessarily including the printk's within my binary? Thank you=
 all in advance.=C2=A0<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/be611220-86a8-436a-8009-e50d6760e609n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/be611220-86a8-436a-8009-e50d6760e609n%40googlegroups.co=
m</a>.<br />

------=_Part_11808_769006558.1699268697417--

------=_Part_11807_886856692.1699268697417--
