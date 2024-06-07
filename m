Return-Path: <jailhouse-dev+bncBCVZDQ5D3IBBBVFERKZQMGQE3ITN5LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BF8FFAEA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 06:53:41 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-df796aaa57dsf2640420276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 21:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717736020; x=1718340820; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNA2Tb46QdNgSzxkPQHsZ6+MRL9uabxjoCbA8laaJ/w=;
        b=VcihNO+SATuC8Atybq7EJpi4Mo3zmpzoP74L4OSreG1ag/UqTiwCD4fMvKJ0dBKYQa
         jgQ4LiqoEJa2aD3jnLFGGPe5I3PKz8Y7xtZTrgs/nErxixslACgI6barmZa36E8j+rrT
         STzQdo6BJz0LXzh66UE9TjtGn2c0K3A9vryyQAhvjB/HX9y/NHCieGPMAhjWIbqZYId2
         Zah2H1Yk8lt7y1XjsKBI3lOYtYPz9YheqiOOvgD/KdHuecKfkoAIsExQHpjX5jycaFBO
         2O5wSvr47zG6E6mq8MeQ8KHxaxvw/g2qFrKWGbW1BihNQtXe16m8IYpxDwTAq6xEOTco
         CzFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717736020; x=1718340820; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNA2Tb46QdNgSzxkPQHsZ6+MRL9uabxjoCbA8laaJ/w=;
        b=KtEXkMfZrlYo2oO5hNgsAY0JCrBsqBaEUYSUtY0YH3VJExUq4TMuCyB1u9LkpfwHZy
         ECFwprBPYMwh2v/eLsOAVAgQTJmdDzlNIMLKvBfe5ubLiNMsIkSU0UdtGlA0WvOgxrTE
         ihMpI8TEcoWK1nw6gr47wdMO8kkFGemNf4Y/jtl3kdUKjphVCqTshWFBstGlUAI0VEvu
         Mx0T78R0pJtuxiJQfacdXgRvGW3QakKfG+xEUh5SAazU4g7pUjd/PLLkcb/4cjr/Nvxy
         mBUH6EZeObWt7uGIM9xKSyU4iphnnv9rUW7ON9IyMgpHE8QH/jhmlNmf4WLxiSJ7Mmwi
         1XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717736020; x=1718340820;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNA2Tb46QdNgSzxkPQHsZ6+MRL9uabxjoCbA8laaJ/w=;
        b=hwwAJPyUDlFBG16RcIA0JR8NVxuFbvvbDw7bmSBKilXdu2NqzKdD8FmrsuXgM1Keau
         G6IAbvhlLYKBTs8zgM8Owrbu46R6IcLLCSxBJI2aGzXQkhSG7+j2f/mzbC7AwKCPclj1
         lQ07rRrym8kHe2ev+orKrp0RJ+1Do/GPQAGwraChYaUODXerNFxytJTyg5TUSszmuTmB
         xc4o8XchSzWzp32jWX08jArw9enBZmdbq0tb8S996QAWu7j7YmcM9mI1QZXYOwrtPTrL
         fiLy6zvRWx+GzQdWgDqZcZUQSjCCix4chMXncCcQdb6sY9RouVzTPDwzIzLH8+XWMAo+
         MiQA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWZQJ4Xr9z4+4ouGJeSMDuZb7ejwJNrojBDcfMJ3K6NRb1DAnoz3eH+8ONCQFsA2LPW3pXKwqJIK1oDGy+h/YfCbi3pBKuGtedHupQ=
X-Gm-Message-State: AOJu0YwKldTJgKsEArr9W+/DX0D5bv/J17/TnvjFKaVH1yfM4hDmqsa0
	JN3TNAcFdGhgnanAcHq0wmEbqG1BMCFRDBtkc+cgB2/wwiJ0aoYO
X-Google-Smtp-Source: AGHT+IGNB83OjCUpXKlUzKXxHcB8SqYkVb5YZ26qpiZ7hWxz4c3ZseIa/FWapGw2KCSs0rpWdudv7g==
X-Received: by 2002:a05:6902:2312:b0:df7:93c8:5491 with SMTP id 3f1490d57ef6-dfaf64dcca8mr1786669276.28.1717736020580;
        Thu, 06 Jun 2024 21:53:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc22:0:b0:dfa:56ce:d390 with SMTP id 3f1490d57ef6-dfaf12a27edls1175976276.0.-pod-prod-08-us;
 Thu, 06 Jun 2024 21:53:39 -0700 (PDT)
X-Received: by 2002:a05:690c:9e:b0:61b:e519:4d93 with SMTP id 00721157ae682-62cd5688d11mr3950547b3.8.1717736019359;
        Thu, 06 Jun 2024 21:53:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 21:53:38 -0700 (PDT)
From: Harry Conor <harryconor237@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4915a077-24bc-41d4-b6e0-8873fdbfc6bbn@googlegroups.com>
Subject: Buy psilocybin mushrooms online
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_38867_358333999.1717736018764"
X-Original-Sender: harryconor237@gmail.com
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

------=_Part_38867_358333999.1717736018764
Content-Type: multipart/alternative; 
	boundary="----=_Part_38868_1712994880.1717736018764"

------=_Part_38868_1712994880.1717736018764
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy your psychedelic products fast and safe delivery=20
https://t.me/highlandview=20
https://t.me/highlandview=20

> =E2=9C=94US-US Delivery=20
> =E2=9C=94Fast Shipping=20
> =E2=9C=94Secure Payment Options=20
> =E2=9C=94100% Satisfaction Guaranteed=20
> =E2=9C=943 Days Refund Policy=20
> =E2=9C=94100% Money-Back if any issue with the product=20
> =E2=9C=94Shipping Service: Express/Standard/Economy=20
> =E2=9C=94Estimated Delivery Time: Express & 3-5 Days=20
> =E2=9C=94Discounts: Get up to 20% off=20

https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview=20
https://t.me/highlandview

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4915a077-24bc-41d4-b6e0-8873fdbfc6bbn%40googlegroups.com.

------=_Part_38868_1712994880.1717736018764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy your psychedelic products fast and safe delivery <br />https://t.me/hig=
hlandview <br />https://t.me/highlandview <br /><br />&gt; =E2=9C=94US-US D=
elivery <br />&gt; =E2=9C=94Fast Shipping <br />&gt; =E2=9C=94Secure Paymen=
t Options <br />&gt; =E2=9C=94100% Satisfaction Guaranteed <br />&gt; =E2=
=9C=943 Days Refund Policy <br />&gt; =E2=9C=94100% Money-Back if any issue=
 with the product <br />&gt; =E2=9C=94Shipping Service: Express/Standard/Ec=
onomy <br />&gt; =E2=9C=94Estimated Delivery Time: Express &amp; 3-5 Days <=
br />&gt; =E2=9C=94Discounts: Get up to 20% off <br /><br />https://t.me/hi=
ghlandview <br />https://t.me/highlandview <br />https://t.me/highlandview =
<br />https://t.me/highlandview<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4915a077-24bc-41d4-b6e0-8873fdbfc6bbn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4915a077-24bc-41d4-b6e0-8873fdbfc6bbn%40googlegroups.co=
m</a>.<br />

------=_Part_38868_1712994880.1717736018764--

------=_Part_38867_358333999.1717736018764--
