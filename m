Return-Path: <jailhouse-dev+bncBAABB6FUU6IQMGQE5HJLY5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-f189.google.com (mail-oi1-f189.google.com [209.85.167.189])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F94D4548
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Mar 2022 12:01:14 +0100 (CET)
Received: by mail-oi1-f189.google.com with SMTP id m16-20020a056808025000b002d9ddfbc38fsf3348433oie.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Mar 2022 03:01:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646910073; cv=pass;
        d=google.com; s=arc-20160816;
        b=HS+/jpJe8HyDBqf9lVLJD2QHqqK5QyYhNrAuAN6EK2Q8/59fYBHNuwpad73zshUZu5
         jIAINjEHFZnBshl7qv23+pRqOii9YtUhZhUIE+shiAOoVeafBB9riwR3kSSovrYZ/3dc
         6pNwcXAN/R7OCqcvTQ8JqIBmAymXdCM5gPSBjeviuD4C0F7YoqdQ9NdNyyCtnGPSiO8I
         NXquCO2pHRZs1K9nvRLpyBSZmnZiDgU+uVUZo/Ad1pikEplmf4dh900QKJAP51xasN44
         Ds4RGdIY7EMWvq+QaNPaVC6acL6h0ALYJHonVVy1bPjouZk0NJ6Npv+ATw0uiinOV27u
         1yHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:subject:date:reply-to:to:from
         :sender:mime-version:message-id;
        bh=2PD5gOaWkaflM7b6F6HPADuu152ptXW5oVz2TzQHUW4=;
        b=BdvmJCyaLfFoGcPL3gLeFhSqs7QwNsirF84wwPcHUfHtSz8O3DBGmz+DTjM6rsxB1/
         w68PDqkrX6LqJW9afckLij2Uan+BsWfv4YrPAvDdPjmghWGm6Az2oXV0f7TbWQYilN5/
         5TD2+O5kOH6FXaN788qzMz+ZR74uVLQg4UZw18lJ7wJefdpko1L0mAdF80JauIr1vc1/
         ygRb4PlT1v52di9PJV/5NIVSzM5jeJUnxmFgubajvbvEP5kgrNFNpwBIUXJFnLtQ/FfZ
         0VECDwxcQDa+dOlkU9X2fpApCcsB249A+lsnoOoYmlQTWTO6Hk8sjA62Tni8NPXEw50s
         1WRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 47.90.198.145 is neither permitted nor denied by best guess record for domain of emmaluo@cydhyteam.ltd) smtp.mailfrom=emmaluo@cydhyteam.ltd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version:sender:from:to:reply-to
         :date:subject:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2PD5gOaWkaflM7b6F6HPADuu152ptXW5oVz2TzQHUW4=;
        b=5Hck7DkAKIv34S6J5mExqDz5QNmm0Y8wAjnayyj+hW6sblYoYRLNZdPdfwLtX6lT2r
         DLbaTbdOH3erdEpyjzACJaR1QbsOR20JjSxX86Fknu/0DzkfAwKhcwZCUNrAvHsS7O/E
         iE1SmCoVqvOWONBPG2yHZSx8IqGvv1Yh4zvScJENkY6XCBimIIgV2+FbbP9ifRHrkNws
         QhQ7vzdmv05ymqH8CKUksA5wGp5LNE+GSYMZwUvvFLR8EU/cHlqELKzaBIT88SK56PqR
         RwdkZ34/5HQJHQQA9rbRM5ftp2RBmgRjJgPLVvzKUY34a1YtOYkVrGfjqOxZLov8cuss
         CtFw==
X-Gm-Message-State: AOAM530+KfL56CazbDnZfwZq0ZHu3J0MuxIuDhDlEFjTe7QcYVcJRjMq
	PPVs6ykMh6EGR/VefoaLbhQ=
X-Google-Smtp-Source: ABdhPJxjGOFMnPQCNW7WQIAsA+GHhhyJ9WkmYPq0MeUbBA/+eKEMeo4Ao8anE87TmBn21aXvAgcCVQ==
X-Received: by 2002:a05:6808:14d2:b0:2d9:dad1:a148 with SMTP id f18-20020a05680814d200b002d9dad1a148mr2760007oiw.257.1646910073324;
        Thu, 10 Mar 2022 03:01:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:ea09:0:b0:2da:4de9:e662 with SMTP id i9-20020acaea09000000b002da4de9e662ls1244101oih.8.gmail;
 Thu, 10 Mar 2022 03:01:12 -0800 (PST)
X-Received: by 2002:a05:6808:21a8:b0:2d7:8eec:ba5c with SMTP id be40-20020a05680821a800b002d78eecba5cmr2884548oib.100.1646910072475;
        Thu, 10 Mar 2022 03:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646910072; cv=none;
        d=google.com; s=arc-20160816;
        b=HK5sopFg5ASPwxiEfFtWosEz/B7LNNKXZA79GGdYmkjwVn+cCmNqc1XjFGxY2eZvIp
         M1OXujkp4RIsAdhE+16FUY1BMGnppTHFTMAdWh8vEvCwUwnBhLvPFrAbc8KD6TqQ9Q0U
         6CyiBqWCyvkrO7a18bt5q8/7sY4BfrpjPOILb4kP6lYuiCdaOpGtrRA5uRWKRG5eBGai
         922a09pOxipiG8GRM2BUwmOl/RhmhYyI7UNC8KnZTLfJHLqmQE4yq7UlG6m9LlZ+8vfm
         eiWiST1M8BO0gpv+4LjTTD4/DHgoHBrlNWL6bitUw7vJCf0oDesVhLPJMTDbV0s7otAC
         sDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:date:reply-to:to:from:sender:mime-version:message-id;
        bh=29Hjx8QiAa/eIQpIW88bvgGW5LSAljEPb5RL+kssGcc=;
        b=VuUtIlHWuoCN4voJ2LKBafgsBfhiMwFwZWcwC/fKzq/CBxPMl7Xr5FErLrPF69u64z
         Ve+BLx6ls8Syl6t/ry+LFDpdha5alzEugZnOiICiJIwsKIxdg0Z/X84Vf6dTR5uW8+eP
         A1soEMgMDVKv5cQTWfsaFqWHl2uriMhR6DvdmN2bDDmfN2aakfviAmsOJGsSW2DPWbMD
         QVh1W2Zm3OIj9Xmn56ND5v1F8UzkQxanr1ScHTtNM5Y427iY8rMU+qaAmkAQ+CkOwV9P
         XbjJNngpFsBUkU/b8CtHhJOvyqtHvQH9P+zy/q00IBmtLDsZw0d/9qefkPFI+uivBQoC
         wKTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 47.90.198.145 is neither permitted nor denied by best guess record for domain of emmaluo@cydhyteam.ltd) smtp.mailfrom=emmaluo@cydhyteam.ltd
Received: from out198-145.us.a.mail.aliyun.com (out198-145.us.a.mail.aliyun.com. [47.90.198.145])
        by gmr-mx.google.com with ESMTPS id k8-20020a4ab288000000b0031c361dd941si190797ooo.0.2022.03.10.03.01.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 03:01:04 -0800 (PST)
Received-SPF: neutral (google.com: 47.90.198.145 is neither permitted nor denied by best guess record for domain of emmaluo@cydhyteam.ltd) client-ip=47.90.198.145;
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.5453902|-1;BR=01201311R141S11rulernew1335_05242_200728;CH=yellow;DM=|OVERLOAD|false|;DS=EDM|edm_business_exp|0.81304-0.0275935-0.159367;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=emmaluo@cydhyteam.ltd;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.N1GY2vs_1646910034;
Received: from T5LB1EYVIS5UCUC(mailfrom:emmaluo@cydhyteam.ltd fp:SMTPD_---.N1GY2vs_1646910034)
          by smtp.aliyun-inc.com(33.45.37.94);
          Thu, 10 Mar 2022 19:00:34 +0800
Message-ID: <20220310190042605.emmaluo@cydhyteam.ltd>
MIME-Version: 1.0
Sender: "Emma Luo" <emmaluo@cydhyteam.ltd>
From: "Emma Luo" <emmaluo@cydhyteam.ltd>
To: "Jailhouse-dev" <jailhouse-dev@googlegroups.com>
Reply-To: emmateam@163.com
Date: 10 Mar 2022 19:00:43 +0800
Subject: Re: Jailhouse-dev, How to choose/pick the Bluetooth Speaker?   
 #Z279Y002 #
Content-Type: multipart/alternative;
 boundary=--boundary_677_a7d52df5-8932-4f5d-aa9e-a689aaf40e41
X-Original-Sender: emmaluo@cydhyteam.ltd
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 47.90.198.145 is neither permitted nor denied by best guess
 record for domain of emmaluo@cydhyteam.ltd) smtp.mailfrom=emmaluo@cydhyteam.ltd
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


----boundary_677_a7d52df5-8932-4f5d-aa9e-a689aaf40e41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jailhouse-dev,=20
Glad to hear that you=E2=80=99re on the market for Bluetooth Speakers, we s=
pecialize in this field for10 years, with the strength of ERU&amp;USA ANTIQ=
UE FURNITURE, with good quality and pretty competitive price.=20
Also we have our own professional designers to meet any of your requirement=
s.=20
Should you have any questions,call me,let=E2=80=99s talk details.=20
Best regards!=20
Emma


Tel:18075121146 (Wechat)
QQ: 1207985400
Skype: mixiubaobei

Shenzhen CYD Electronic Technology Co.,Ltd
Add:3rd Floor,B Building,No.96 Lingxia Road, TuoPu Industrial Park,Fenghuan=
g Village, Fu Yong Town,Baoan District,Shenzhen,China

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220310190042605.emmaluo%40cydhyteam.ltd.

----boundary_677_a7d52df5-8932-4f5d-aa9e-a689aaf40e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>
<html><head><meta HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=
=3DUTF-8"/>
                                      <title>Re: Jailhouse-dev, How to choo=
se/pick the Bluetooth Speaker?    #Z279Y002 #</title></head><body><P><FONT =
style=3D"FONT-FAMILY: Arial" size=3D2>Hi Jailhouse-dev, </FONT></P>
<P><FONT style=3D"FONT-FAMILY: Arial" size=3D2>Glad to hear that you=E2=80=
=99re on the market for Bluetooth Speakers, we specialize in this field for=
&nbsp;10 years, with the strength of ERU&amp;USA ANTIQUE FURNITURE, with go=
od quality and pretty competitive price. </FONT></P>
<P><FONT style=3D"FONT-FAMILY: Arial" size=3D2>Also we have our own profess=
ional designers to meet any of your requirements. </FONT></P>
<P><FONT style=3D"FONT-FAMILY: Arial" size=3D2>Should you have any question=
s,call me,let=E2=80=99s talk details. </FONT></P>
<P><FONT style=3D"FONT-FAMILY: Arial" size=3D2>Best regards! </FONT></P>
<P><FONT style=3D"FONT-FAMILY: Arial"><FONT style=3D"FONT-FAMILY: Verdana" =
size=3D2>Emma</FONT></P></FONT><FONT style=3D"FONT-FAMILY: Arial" size=3D4>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Verdana; WHITE-SPACE: normal; W=
ORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0)=
; FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGR=
OUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-style: initial; text-decoration-color: initial">
<DIV>
<DIV><FONT size=3D2>Tel:18075121146 (Wechat)</FONT></DIV>
<DIV><FONT size=3D2>QQ: 1207985400</FONT></DIV></DIV>
<DIV><FONT size=3D2>Skype: mixiubaobei</FONT></DIV></DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Verdana; WHITE-SPACE: normal; W=
ORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0)=
; FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGR=
OUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-style: initial; text-decoration-color: initial"><FONT size=3D2><BR></F=
ONT></DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Verdana; WHITE-SPACE: normal; W=
ORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0)=
; FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGR=
OUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-style: initial; text-decoration-color: initial"><B><FONT size=3D2>Shen=
zhen CYD Electronic Technology Co.,Ltd</FONT></B></DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Verdana; WHITE-SPACE: normal; W=
ORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0)=
; FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGR=
OUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-style: initial; text-decoration-color: initial"><FONT size=3D2>Add:3rd=
 Floor,B Building,No.96 Lingxia Road, TuoPu Industrial Park,Fenghuang Villa=
ge, Fu Yong Town,Baoan District,Shenzhen,China</FONT></DIV></FONT></body></=
html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/20220310190042605.emmaluo%40cydhyteam.ltd?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/20220310190042605.emmaluo%40cydhyteam.ltd</a>.<br />

----boundary_677_a7d52df5-8932-4f5d-aa9e-a689aaf40e41--


