Return-Path: <jailhouse-dev+bncBCZ3RCOBYMNBBTEN7KUAMGQE3AG5V3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E797B9C59
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Oct 2023 11:50:06 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id 46e09a7af769-6c6204b2defsf1013193a34.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Oct 2023 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696499405; x=1697104205; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVP3HtV752Xn3s6uMOGg1+MUn0Ovj/IncoW93WZA1e4=;
        b=cp2zXYbcrzbpfaSNoF7rvp4sWeV1eV/HCfS2h2lbnHO6SRZWgXpk5xMoFZ0wrpM+Gy
         Laje60M+HQHilOJDKQhi5yCGk66T03DF9K4J722AxlLapXuanrIegN4lwnbrB1NOQJoq
         O3qjqx7o0OISx9X3oxwYqXomXuyoisz8r0SZZz2pDrHS4KNt2w5dWZkH8YaC5E70wOr+
         IvIGif60ld9BDHPPe/9+BH1K2FibunkZjwcIR7vQJFQwmiBo2QayQ2Z7iv5Glz8Yq4yy
         appjeSwf1D+QYH1x53ZP8mUZqPn785gGYKSbXbPWcsnxfafBpNZjbL0osA9LZMJUYJfV
         adpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696499405; x=1697104205; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVP3HtV752Xn3s6uMOGg1+MUn0Ovj/IncoW93WZA1e4=;
        b=dw0PZ90/HUoeG8uZDDrHGfoHxItc9TfrpzQ4cydCv4VqyarLSdfcQBwLdB04NgWdPd
         B4T56qUbcEak6XvfOnX12D9dE9af9FuWzE7GQMd7GgDbaJxM/7e7rDdVvgHYfuCXYixX
         F/RdQ2ZDwTrQCeBRV0YaGofg8Jk9AbBx7sa73l6AN647/5lGs/w5hA3N0BXVDtUTcqTO
         U+5JH7OYkt1lR9DHpS2nx6cvnGTHozpl65gDTy6erOBhfXL77DshD76bvqON/DVo6AEN
         XkXLY7EPBvkdhwzNCOJ4BnnwPjH6tGiaB8ckzSfHSKe/nei7mYoWq/nIT2bF4DgpKQY1
         geaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696499405; x=1697104205;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVP3HtV752Xn3s6uMOGg1+MUn0Ovj/IncoW93WZA1e4=;
        b=u6KHU2FiYyCjPKhpMx4fy2Aq8IyBW4hAZHkrOX1z5fzG5YeuhAZa8OwTBhAB2+bM0p
         DpAkNbpbLfaIKR8xk/aoVjsGHUg+HxYnL7m4LWvf7WvBt4PYffN06JKV+HyHGnyI9lhR
         yyUZBTxIRRxnO2FPH+NbiFG95mkgLuZg566Jc9AH+amoVstIJ9HCPsc9E0RAx5iBdP07
         zrapxxWt/AdUUjtk9fWNX+jLuJXJqROW5y8Vl9kqvcxCz+d5ffIVYMg+uVxQXWC/4JdJ
         jxSLOnK6hKO0EZUVj3Gsq0LbnUNQaG8E0ZtHQcpbINFkfXjmWdgVWDuiBDrXAlBU3iDP
         85DA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwjxSfHdOENTckXBSckzQ8mLWGjvJ3Vlp2YvNFugFB0qVq05t9l
	F97zqNYf6zldNRgrvv/PljI=
X-Google-Smtp-Source: AGHT+IGr8DO+S62+uKEEiUSGSGWT9g1fyx+a9vuWz6E70Hqos52gTR/Fr4NMzIn/n40XXePCy8caVA==
X-Received: by 2002:a9d:7f92:0:b0:6b9:dc90:8a85 with SMTP id t18-20020a9d7f92000000b006b9dc908a85mr4840887otp.24.1696499404996;
        Thu, 05 Oct 2023 02:50:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:5101:0:b0:57d:dd53:e6cb with SMTP id s1-20020a4a5101000000b0057ddd53e6cbls949724ooa.1.-pod-prod-04-us;
 Thu, 05 Oct 2023 02:50:03 -0700 (PDT)
X-Received: by 2002:a9d:61d4:0:b0:6bc:fb26:499e with SMTP id h20-20020a9d61d4000000b006bcfb26499emr1409416otk.2.1696499403652;
        Thu, 05 Oct 2023 02:50:03 -0700 (PDT)
Date: Thu, 5 Oct 2023 02:50:03 -0700 (PDT)
From: Sara Alonso <alonsosara44@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en@googlegroups.com>
Subject: How to use a TTC timer with jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5578_870356844.1696499403027"
X-Original-Sender: alonsosara44@gmail.com
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

------=_Part_5578_870356844.1696499403027
Content-Type: multipart/alternative; 
	boundary="----=_Part_5579_1881494846.1696499403027"

------=_Part_5579_1881494846.1696499403027
Content-Type: text/plain; charset="UTF-8"

Hi!

I want to create an inmate where I generate a periodic interrupt with a TTC 
timer (I am using a zynq zcu102 board). The address of the TTC is 
0xFF120000 and the interrupt number is 71. I am writing the c code for the 
inmate and I have used irq_init(Handler) and irq_enable(71) to enable the 
interrupt, but now I don't know how to configure and start the TTC timer. 
Are there any functions to do that? Or how could I do it?



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en%40googlegroups.com.

------=_Part_5579_1881494846.1696499403027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi!</div><div><br /></div><div>I want to create an inmate where I gene=
rate a periodic interrupt with a TTC timer (I am using a zynq zcu102 board)=
. The address of the TTC is 0xFF120000 and the interrupt number is 71. I am=
 writing the c code for the inmate and I have used irq_init(Handler) and ir=
q_enable(71) to enable the interrupt, but now I don't know how to configure=
 and start the TTC timer. Are there any functions to do that? Or how could =
I do it?<br /></div><div><br /></div><div><br /></div><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en%40googlegroups.co=
m</a>.<br />

------=_Part_5579_1881494846.1696499403027--

------=_Part_5578_870356844.1696499403027--
