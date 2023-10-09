Return-Path: <jailhouse-dev+bncBCZ3RCOBYMNBBI4TR6UQMGQEZ5HQLZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 076627BD737
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Oct 2023 11:36:38 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id 006d021491bc7-57b8079db51sf5907915eaf.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Oct 2023 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696844196; x=1697448996; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr3jEzlcsT8GpMzkvIA4Iy/WUOYMkzLmL+QLlfj8qos=;
        b=o4XJLMSRpumYf+/g6wkuW2CNWQC85o3WzWke8pu6f7GjNCOZGgZyZ4+P+DAcLyWO8a
         StrQekhU4r2OusxmGPy4GWRFHkIE+9xUUE56RNdpSKhQzimiBxchevhQ1feyjqhT1ak4
         +5SUqMejfnTtYtfDR3gOYTyajb62IsQ7BgWVckrVntAtq3FRNkcZbVxC4h9tbKr6zqo0
         DYLRdulZDnYcisdgSf8nKEi7jcNmX+P1mOkJoysz5JC7g8sI6fGXZ7SiwVjIlkg2kYOo
         et4+Oh4IMTCHWKgGmRFUvzj4msDhQ/FUOPstH/ab3r0aT2WCefLZ7FEL0m3l/Vk/pynS
         s1iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696844196; x=1697448996; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lr3jEzlcsT8GpMzkvIA4Iy/WUOYMkzLmL+QLlfj8qos=;
        b=ZR7oE+1a8nz07kpPFSPDcUONI0eWup0sefbUY1r7cL4PF67ffjq9rfp9H2OQAlN0o7
         Qo8GIyf6gWblyQFTSMQ1Ozo0YNY90LCHvbA1z9A65lEUQhmI3VmBtZTGu40IyGjBwhNP
         wnL8iW9/bUTVH7QWZwyMSaFmS/y/4iWsruJKdICr2i+GJmnLW+Yg24kt0v5TTYU/uMiM
         zBT65c0ED4cTiR7ejN8oZLzQDw0Lp6Z8tknxnuew5wbWSnum8gqiuORZ4gflc0nKG/TS
         jVfu6ZYpkzYt2KsT3mnLkfPPShGBZ/MGmwLLHj1n8JT3pcEtr+stWAmEY1gKZDfZPmo7
         ANlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696844196; x=1697448996;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr3jEzlcsT8GpMzkvIA4Iy/WUOYMkzLmL+QLlfj8qos=;
        b=skipTGfb8gHR9vOyrvpyD7zFrJTW7ECzWB8o34zyzFPH8IEfGEQK5YbjA3JkxJf23z
         FCYTwgph1XsJ+4q0pY8isuaNVo7eHLi/pKXmm1NU08/m4t8tzL7pWRi0CWPbcL+eGDDo
         qifAIhrw4/novYHyq2Vt6MXbYjneN2GIrjScWLsmuppKsJXIFD2/6R29JJsqreigJ5+A
         V5BjMHXJwSmBhxyjmoscchgAJuBMP1ax6eppoLs9yNbvFpB7zj/w+8gXo1P9M12QAFLX
         NNwj5CZT38IsOiD2Xsbrb4xJWH36jB8jmfRhRyvYsFxnVcipZ5BpqzqHjL9pjLlA9md4
         9MTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw8rgXMMb6CYDq8uIe1rie7b+6SXTOQtBMHmSPT4oKAvsIS0yWm
	TDVL9QysPFcLudUe3p1FIBw=
X-Google-Smtp-Source: AGHT+IFbV0iY7PVi3RqMPobKVmxJRTSWaYZIQRiSccmqsDeao4AD7F+aJvS7kLTzNELtSvMMNYfMeA==
X-Received: by 2002:a4a:270d:0:b0:57b:4f1e:96e4 with SMTP id l13-20020a4a270d000000b0057b4f1e96e4mr14206451oof.1.1696844196498;
        Mon, 09 Oct 2023 02:36:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:3708:0:b0:57b:7aef:9d28 with SMTP id r8-20020a4a3708000000b0057b7aef9d28ls5882721oor.0.-pod-prod-09-us;
 Mon, 09 Oct 2023 02:36:34 -0700 (PDT)
X-Received: by 2002:a9d:624a:0:b0:6bf:27b3:3d29 with SMTP id i10-20020a9d624a000000b006bf27b33d29mr4416877otk.5.1696844194508;
        Mon, 09 Oct 2023 02:36:34 -0700 (PDT)
Date: Mon, 9 Oct 2023 02:36:33 -0700 (PDT)
From: Sara Alonso <alonsosara44@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d7736175-0536-49f1-8281-6d74c9457ab0n@googlegroups.com>
Subject: Multiple interrupts in an inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8032_2106236654.1696844193735"
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

------=_Part_8032_2106236654.1696844193735
Content-Type: multipart/alternative; 
	boundary="----=_Part_8033_1598383577.1696844193735"

------=_Part_8033_1598383577.1696844193735
Content-Type: text/plain; charset="UTF-8"

Hi!

I want to handle two interrupts in an inmate. I know how to handle one with 
the irq_init(handler) and irq_enable(irq) functions, and I guess I have to 
enable the second interrupt too. But I don't know how to link the second 
handler to the second interrupt. I would appreciate any help.

Thank you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d7736175-0536-49f1-8281-6d74c9457ab0n%40googlegroups.com.

------=_Part_8033_1598383577.1696844193735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi!</div><div><br /></div><div>I want to handle two interrupts in an i=
nmate. I know how to handle one with the irq_init(handler) and irq_enable(i=
rq) functions, and I guess I have to enable the second interrupt too. But I=
 don't know how to link the second handler to the second interrupt. I would=
 appreciate any help.</div><div><br /></div><div>Thank you<br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d7736175-0536-49f1-8281-6d74c9457ab0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d7736175-0536-49f1-8281-6d74c9457ab0n%40googlegroups.co=
m</a>.<br />

------=_Part_8033_1598383577.1696844193735--

------=_Part_8032_2106236654.1696844193735--
