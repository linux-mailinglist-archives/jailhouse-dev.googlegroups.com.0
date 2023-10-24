Return-Path: <jailhouse-dev+bncBCZ3RCOBYMNBBWMM32UQMGQE3DZQ6ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3937D4B23
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Oct 2023 10:54:51 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id 46e09a7af769-6ce26d7fd45sf6639769a34.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Oct 2023 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1698137689; x=1698742489; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9leyOGkbCk+ZFmhkjrSH9aawVrU07Ej0xZ3QzhDmiY=;
        b=EiAJIjjSeQoWtBWK72SUUgocPItG+fU+Xcnw5NyjckH0KRkXW+BqawLOQXK785L2qD
         Qn/qCIcTf5eq/ztCYzoxlKWB1QYYQh3HxRWKQFqTuGEXYR3SwDFj8jJ0B2HDJm7q2A9q
         2gqdNoTO+z40dbR97NiXxKX5+gZ6uwPaLR3HhRaQks4iO7dopjJ5i1vOzNKReTFURh6e
         GSPEewrsml3AXIFR6frjq2uc1LRK9d7EXXc1hIyczZ6GUyVXaDkKxa1/0FG3FbmE9NhY
         4pn6eMvF/oxhBjudoNwcPeyJicV5U48o0aQ1mIUdce3gUWE+Aca60RnUozzdoQK9uKNt
         3uhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698137689; x=1698742489; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9leyOGkbCk+ZFmhkjrSH9aawVrU07Ej0xZ3QzhDmiY=;
        b=KM6QfIRbIUc+gtzg0haeMn9OkcvbSmeE6R1mI6q9DI7kM/+toTRB1RVRLSBAotIsUB
         /9x59zC/zIivNcgKRHB1eFpqVGMvVkuH6DPOLfLBC9LOe0pjhVKqdECMk5xmoRW0CaHF
         0goUYdtNJ36Q4Uew6HrGy1Qf4F5Hh1ZBiBNuY3GAguIxY1EHvDN9BUGxD81oK4D/1K+S
         suJS78LOcXzwYHlWtgi0KdvbiWuMqUnjV9fRJ4c3Z20H+3Im8/dUAzc2FAmOIitbwHHK
         vSjnabiuKxkUer/2lUnZcPIaZYVp2v8BgHJcfPJR1eH0DYg9Qiucb6Uv2lH+jSeZJi7W
         7hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698137689; x=1698742489;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9leyOGkbCk+ZFmhkjrSH9aawVrU07Ej0xZ3QzhDmiY=;
        b=PbvpgD09nq2XU/CnR+dMgGyX/Hp4gvlkK4RFOlFMt8AywU8Dw4+cEHOt3DSPCMQDbZ
         5J6ucjHLjdQZip9YpKAMkFEQJ4iphBLvGCfEgYR2N55UrlmklV5Ainb9yTIvn5DENNlE
         BAd5DN7fP/T2qHvhl9GWdvxqiHDcpiFSdOMxEhfKewwL0+TXHsL8+M3oQXkSgNDi40a4
         367t+bmu7stMkaUh2Q9S1WXNgE9CSEvCjKXCRIUD3w4btJ07pXJMJnq37dAwmSBbKgX+
         yLM9MVzCZqWAxHUsyftNGcoV4GNu0jdHLp27zI39ThAd2bO1h67j2hImS8LhO6DocUSU
         519w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyodQwLfIhqrrflhjsH3xoA66MsW8jsWzn1U9SJ527z3ezzupf1
	4EEJNlSSFENpD9OJOiSwjOE=
X-Google-Smtp-Source: AGHT+IHNtoRLG0MKlktXosfrSCHObHXJUD1b5NQNzL9/eA3ogKI1SbcAINIRcWnSW8PG5uuB3x7Iog==
X-Received: by 2002:a05:6870:1210:b0:1ea:7bd1:c48d with SMTP id 16-20020a056870121000b001ea7bd1c48dmr13569176oan.49.1698137689581;
        Tue, 24 Oct 2023 01:54:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:4512:b0:1e9:d835:c43d with SMTP id
 e18-20020a056870451200b001e9d835c43dls261516oao.0.-pod-prod-06-us; Tue, 24
 Oct 2023 01:54:48 -0700 (PDT)
X-Received: by 2002:a05:6871:5211:b0:1dd:39ce:e25c with SMTP id ht17-20020a056871521100b001dd39cee25cmr5655851oac.3.1698137688618;
        Tue, 24 Oct 2023 01:54:48 -0700 (PDT)
Date: Tue, 24 Oct 2023 01:54:47 -0700 (PDT)
From: Sara Alonso <alonsosara44@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4267ad1b-14cf-4eeb-97d6-27da920a8c05n@googlegroups.com>
Subject: vector_irq() function
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3558_1525773331.1698137687807"
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

------=_Part_3558_1525773331.1698137687807
Content-Type: multipart/alternative; 
	boundary="----=_Part_3559_1592938639.1698137687807"

------=_Part_3559_1592938639.1698137687807
Content-Type: text/plain; charset="UTF-8"

Hi!

I want to use the vector_irq() function from gic.c inside a handler to 
check which interrupt has been set. I have tried this:

if (vector_irq == 0x0000000000004a04){
firq1_set = 1;
}

But I got an error... I don't know how to use the vector_irq function, if 
anyone could help me with this or give me an example, I would appreciate it.

Thank you!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4267ad1b-14cf-4eeb-97d6-27da920a8c05n%40googlegroups.com.

------=_Part_3559_1592938639.1698137687807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi!</div><div><br /></div><div>I want to use the vector_irq() function=
 from gic.c inside a handler to check which interrupt has been set. I have =
tried this:</div><div><br /></div><div>if (vector_irq =3D=3D 0x000000000000=
4a04){<br /><span style=3D"white-space: pre;">		</span>firq1_set =3D 1;<br =
/>}</div><div><br /></div><div>But I got an error... I don't know how to us=
e the vector_irq function, if anyone could help me with this or give me an =
example, I would appreciate it.</div><div><br /></div><div>Thank you!</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4267ad1b-14cf-4eeb-97d6-27da920a8c05n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4267ad1b-14cf-4eeb-97d6-27da920a8c05n%40googlegroups.co=
m</a>.<br />

------=_Part_3559_1592938639.1698137687807--

------=_Part_3558_1525773331.1698137687807--
