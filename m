Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB7UCXC2AMGQEGX76IOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFEE92C941
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:35:28 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-e03a74ca08fsf1401356276.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720582527; x=1721187327; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fxdx/gmMBI1cP96K/sT7I+5C4jB3uLtm5ANpmGTz4w=;
        b=VC6txZM9rXqSRDeo0P+3HskVfMK0kgazOO2dvAuKLrhnK4pMTOtvxkVA2TXck7Z/bG
         PTyxX63+Rw7jT6i7QiMJb2OR1dnvUtg+4UqZ4P5AMqBg0EXxCuSAxeYiLUSvc3mkjI1p
         xbycwmd17OJD1ZUTiMBGuPZdPn2Su/NKBID6lJyKblG9QqVSzBpe53/JoAUVmvMXglnh
         At7ZgF4u1/XuCBqEE2CL0Hd2atGg28W5Jj7O7Czs8DBKXhPBY2kWBAwBQdRzWMmvGB9E
         wjOhCsVh9K84ztNG12D1hp3/NEjmOeRsAC0kSq5C+F5bmZMaTZdjfcZu28+4OXGjZsXs
         WNXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720582527; x=1721187327; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Fxdx/gmMBI1cP96K/sT7I+5C4jB3uLtm5ANpmGTz4w=;
        b=bUCezdBpFTTiCRAEs9G3RIPgRkNINrXpScMvxNB5DbGPo0ca9QLnk+T+2NZ/unxcYO
         BMwGoye5s4fJE+W3vIkTHG4jch5Cb4vglROqIGvsKSiexV5TJOLSalLRyKd1BWxHPOXi
         ScDqVN6mZyFc7OvtgMg8FmE/RnxnMyCNYZpmXru0swKrmzK8f4ENo+QQmwEdpAg2+PJD
         8DbhSYWobAbU/7jBYAzEWhd6Dlaj8MD8kxpJLeooOhkMR73/tnhB83hc37wT3nm56H6Y
         FGknETtx9p4fpsKRzX+YPaTlpHxLcKdRd+UuTP1L4zmTZ7Xh6fN8ZgPSp0TQ34nfF6V2
         fAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720582527; x=1721187327;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fxdx/gmMBI1cP96K/sT7I+5C4jB3uLtm5ANpmGTz4w=;
        b=IWTJtuUZr+0no0H9gSsJoxZe4fRgQme7+fCtRltzdsF8Y5Jh4H57FyG+br0Wc+iBxt
         2giMRCUOmWugp83OM+wWICznWQGHEy0MAQP5GzzHZ+p7zbP8K/SW0FND4xl3aStx+o0l
         MqYQA4SsG0w6tFnn4yBIRWL6+JV3clHBna+Ivndu6/22v3ppPoqjE8PcsIqg65YD2uxl
         dV4hPJX9M/J7wb7H+cZ4rNrdlDQetFNonOwoWDzBdDlHa90GJltYVW6B+5feR0jVHvwB
         HrQBIHkIZ2lbMbsAEwljfdHjhs6cInljS4vMcrfaD7KStMv8SpD0rmUCxEaNLqVDM21y
         B1XA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWFrIvCRrXJh6i/7WwVO1s7FeqFb9J8gw+NtlMWTBopK24kpIegSRNJXZOUqwLh3alhVmI0COL7XcPAn1LtCIw4FPMHuEvNXh62iLk=
X-Gm-Message-State: AOJu0YzWdeblPtRZorrZoBkm4AgogJyD6BHhGyTFKcGppuLKwS34hee9
	wzFCkgBRSYw3OA0O+B4D3eyRu2NetrjEXI3ewSP4ynlvrmZOHA7f
X-Google-Smtp-Source: AGHT+IGcEQJZjZ5PlQKZ9P8hxnNcZ57al0fwcONCpTqXSzmt6ASgDy4sXOUrFlFhg8NSJzTfFOhQXQ==
X-Received: by 2002:a25:ac59:0:b0:e02:7fab:f00f with SMTP id 3f1490d57ef6-e041b05b8f3mr3901067276.2.1720582527208;
        Tue, 09 Jul 2024 20:35:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1205:b0:dff:aa9:b9ad with SMTP id
 3f1490d57ef6-e03bd07819cls8961955276.2.-pod-prod-08-us; Tue, 09 Jul 2024
 20:35:26 -0700 (PDT)
X-Received: by 2002:a05:6902:1b8c:b0:e03:a2f7:729 with SMTP id 3f1490d57ef6-e041b03771fmr25511276.3.1720582525858;
        Tue, 09 Jul 2024 20:35:25 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:35:25 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <25a41179-e94f-41ea-886b-7a4ffa0f87d7n@googlegroups.com>
Subject: WERE TO BUY DMT CHOCOLATE BARS AND MUSHROOM ONLINE FOR SALE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_134500_34088318.1720582525265"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_134500_34088318.1720582525265
Content-Type: multipart/alternative; 
	boundary="----=_Part_134501_1878792796.1720582525265"

------=_Part_134501_1878792796.1720582525265
Content-Type: text/plain; charset="UTF-8"





https://t.me/motionking_caliweed_psychedelics

Mushroom Belgian Milk Chocolate is not only delicious, but it equates to 4 
grams of   

https://t.me/motionking_caliweed_psychedelics

  psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing 
effects, you get from eating the Mushroom and polka dot company chocolate, 
they are also a great way to microdose magic mushrooms. Microdosing magic 
mushrooms in the form of consuming mushroom chocolate bars have recently 
increased in popularity.  https://t.me/motionking_caliweed_psychedelics

https://t.me/motionking_caliweed_psychedelics

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/25a41179-e94f-41ea-886b-7a4ffa0f87d7n%40googlegroups.com.

------=_Part_134501_1878792796.1720582525265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br /><div><div><div style=3D"align-items: center; color: rgb(95, 99, 104);=
 display: flex; height: 48px; justify-content: space-between;"><div style=
=3D"overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><span =
style=3D"font-family: Roboto, Arial, sans-serif; letter-spacing: 0.25px; li=
ne-height: 20px; color: rgb(32, 33, 36); margin-top: 0px; margin-bottom: 0p=
x; margin-right: 16px;"><br /><br /></span></div><span style=3D"clip: rect(=
1px, 1px, 1px, 1px); height: 1px; margin: 0px; overflow: hidden; padding: 0=
px; position: absolute; white-space: nowrap; width: 1px; z-index: -1000;"><=
/span><div style=3D"font-family: Roboto, Arial, sans-serif; font-size: 12px=
; letter-spacing: 0.3px; line-height: 16px; align-items: center; display: f=
lex;"><br /></div></div></div><div role=3D"region" aria-labelledby=3D"c4610=
" style=3D"margin: 12px 0px; overflow: auto; padding-right: 20px;"><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" target=3D"_blank" re=
l=3D"nofollow" style=3D"color: rgb(26, 115, 232);">https://t.me/motionking_=
caliweed_psychedelics</a></div><div><br /></div><div>Mushroom Belgian Milk =
Chocolate is not only delicious, but it equates to 4 grams of=C2=A0=C2=A0=
=C2=A0</div><div><br /></div><div><a href=3D"https://t.me/motionking_caliwe=
ed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rgb(26,=
 115, 232);">https://t.me/motionking_caliweed_psychedelics</a></div><div><b=
r /></div><div>=C2=A0 psilocybin-containing mushrooms. Aside from the fanta=
stic, mind-blowing effects, you get from eating the Mushroom and polka dot =
company chocolate, they are also a great way to microdose magic mushrooms. =
Microdosing magic mushrooms in the form of consuming mushroom chocolate bar=
s have recently increased in popularity.=C2=A0=C2=A0<a href=3D"https://t.me=
/motionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=
=3D"color: rgb(26, 115, 232);">https://t.me/motionking_caliweed_psychedelic=
s</a><br /></div><div><br /></div><div><a href=3D"https://t.me/motionking_c=
aliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" style=3D"color: rg=
b(26, 115, 232);">https://t.me/motionking_caliweed_psychedelics</a></div></=
div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/25a41179-e94f-41ea-886b-7a4ffa0f87d7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/25a41179-e94f-41ea-886b-7a4ffa0f87d7n%40googlegroups.co=
m</a>.<br />

------=_Part_134501_1878792796.1720582525265--

------=_Part_134500_34088318.1720582525265--
