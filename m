Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBSM4TH2AKGQERCJAWXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EF19CBCB
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Apr 2020 22:42:50 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id c8sf4518683oib.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Apr 2020 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VCNEz5ergRlQ/vTGN3d3wns14A2cMCKDxqKqX5ynSVU=;
        b=fqPZsHOsWdtY54gmTP3CnhTAlcX2dTukOV9QCo7x/KhvHuu8gQL9uRDWKw6lC3CasD
         lIup+Sr19ObU3y1KQTRkKZGJAqfPLzLch3dNi6YIAsBe/m7Nt9mR5c+1VdiG09edh8JM
         4tYaLWZOlqJ3bmTj9jiGx5ZX41TZ+eL5HcJsI0eHAm2XSm3ZsGlKlK/sWJBsoVrF1G8d
         1dd680sL1/lxFr8vQzW9/rNKkEuFlm44OTvPTY4q+FoAChwKsKGP8b33huOPmjcQhHCj
         yyIrd7nEAzRUUoyuLhhn7mo0i6roa8O2EKd1YE0YnxXzm7ugb2i9fBeVSh7AQVdWY+oR
         Rt3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VCNEz5ergRlQ/vTGN3d3wns14A2cMCKDxqKqX5ynSVU=;
        b=SK2mzjjqwz98/EikZIoe7zMSRcI6R76Mdz7CtqQRugVCjEScMvde2owcwGPl1mEaUC
         jwmUf9aLjo3j7cywGkwBXGF6ISm7pCrrCDKjoBP2ts2wbnO0lyMqBteBdXE4mw5j4b2g
         NPg89axuPj+uK9DIb4aWVtpzV6Zf6BRgLBKNrhSaYNr8S4sPRn0pWhLKcx2honozaMij
         OFOGAmNIpi4Hbxe9FZaCFjU15v/onUYaUB1sxp7qCcGS/5vcPwG7hPoi2XjfYw3luOgB
         ccOVqVXODVkuq13DbjQlt+sp2IHCEf8W5fhlQFEmH8WtcirHjE4bpgNxNB1IsQsGfBEf
         usgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VCNEz5ergRlQ/vTGN3d3wns14A2cMCKDxqKqX5ynSVU=;
        b=iGrgD8JBbKn1Ii2upECcJIuKzewSTzKJuhjjy3A2+em2rVXuUHiNhq0rWncCl7GcC8
         CpWc6Q7rCqlzf6X199IjvQMA7OC6K13cYLHtbEKuz2Texm+cdo1dgjAyl8JIS8BBL6Zb
         DT/SxnBEt27onW6f+15UuHHZY8HMNpAAFzmSpLpZdjveZvEQ1XGSAW+BfCiyPJm1CKF4
         AkzqFBxzGIJ34pRvDMAbQrslRT/iyRQMbjjfw3xpc2NJ5c8IcgjW3wDPxqWIQuAFFJ0G
         if14HFHu55ZmknEfomrNCiyS2TM/QCvjuYbGlRlfRrPiekltee2zYz+w85oACsZWeuJR
         Z91A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYjsUyswYq5kT8Zgku+YglUGDD26prsLj0Vrjvl3qdFEHQS1zvy
	rU1T2k2FWLx33uv/txoDZ2s=
X-Google-Smtp-Source: APiQypJBTCw+b9KU6cqQ57i6slZahS6vazi9ptSjAsGfL0Y59GdGqQ23y+5uJTcMJNqC53Qkg8Ke8Q==
X-Received: by 2002:a4a:d1a4:: with SMTP id z4mr4290095oor.52.1585860169286;
        Thu, 02 Apr 2020 13:42:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:2741:: with SMTP id w1ls546835oow.9.gmail; Thu, 02 Apr
 2020 13:42:48 -0700 (PDT)
X-Received: by 2002:a4a:9190:: with SMTP id d16mr4348384ooh.38.1585860168497;
        Thu, 02 Apr 2020 13:42:48 -0700 (PDT)
Date: Thu, 2 Apr 2020 13:42:47 -0700 (PDT)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ec31e02a-64e6-46e3-872a-66f864e87146@googlegroups.com>
Subject: about communication between root cell and inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_491_1022969817.1585860167971"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_491_1022969817.1585860167971
Content-Type: multipart/alternative; 
	boundary="----=_Part_492_1280340816.1585860167971"

------=_Part_492_1280340816.1585860167971
Content-Type: text/plain; charset="UTF-8"

I tried to run Inmate on jetson tx1 with given sample configuration 
(jetson-tx1-demo) and ivshmem-demo I get the following output only.
MEM: shmem is at 0x000000017bd00000
IVSHMEM: bar0 is at 0x0000000000000000001
IVSHMEM: Hello from bare-metal ivshmem-demo inmate!!!
IVSHMEM: Enabled IRQ:0xdb
IVSHMEM: Enabling IVSHMEM_IRQs
IVSHMEM: Done setting up...
IVSHMEM: waiting for interrupts
Why there is no interrupts coming or I how can I send interrupts from root 
cell to inmate and inmate to root cell?
I have to send data from Inmate to rootcell, how can I do that?
please help me on this.
Thank you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ec31e02a-64e6-46e3-872a-66f864e87146%40googlegroups.com.

------=_Part_492_1280340816.1585860167971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tried to run Inmate on jetson tx1 with given sample=
 configuration (jetson-tx1-demo) and ivshmem-demo I get the following outpu=
t only.</div><div>MEM: shmem is at 0x000000017bd00000<br>IVSHMEM: bar0 is a=
t 0x0000000000000000001<br>IVSHMEM: Hello from bare-metal ivshmem-demo inma=
te!!!<br>IVSHMEM: Enabled IRQ:0xdb<br>IVSHMEM: Enabling IVSHMEM_IRQs<br>IVS=
HMEM: Done setting up...<br>IVSHMEM: waiting for interrupts</div><div>Why t=
here is no interrupts coming or I how can I send interrupts from root cell =
to inmate and inmate to root cell?</div><div>I have to send data from Inmat=
e to rootcell, how can I do that?</div><div>please help me on this.</div><d=
iv>Thank you</div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ec31e02a-64e6-46e3-872a-66f864e87146%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/ec31e02a-64e6-46e3-872a-66f864e87146%40googlegroups.com<=
/a>.<br />

------=_Part_492_1280340816.1585860167971--

------=_Part_491_1022969817.1585860167971--
