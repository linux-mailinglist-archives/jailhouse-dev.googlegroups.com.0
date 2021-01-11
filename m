Return-Path: <jailhouse-dev+bncBAABBSOM6P7QKGQEP5LWSBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A92F2331
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Jan 2021 00:59:06 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id g26sf339269qkk.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 15:59:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610409545; cv=pass;
        d=google.com; s=arc-20160816;
        b=FGqL2uczfEBZq78AFQ4o/E3FSkT4C3AaGA0AzdFOXe4Yvp9AQEL4/82tbiHw1sztUx
         HHkKsrIsqWbMv+vqD1gOXp4tJVvaEV9THCUb5O4sc3qgH9OiGZ2XgYcDU1GNI+vwPYd0
         ElqNierXgcz06FUFmYMhgMOsywT0a0Q2ODG6hiHdhwsw3bFQEqd28nbCYD4l3mnK49w4
         A86ZCPqogdkLS1TpRriOo/6NsbZ4+qNTwh10EuPtzZKJiyPGhZ7aZA29iFjKS9245BM7
         meH7r4h20UQEDT82NHfHecIWGWo4nTHXeU4UeDQWAWAg2WZ0jnCMDVk8G2RFhxGHQv8S
         kdqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:from:dkim-signature;
        bh=pIzEZQtCf/WWWJWXq1lUIHIsKA5YyJp7KWSFqYhp5Uw=;
        b=yrLzLInwptcAqI3f6R/4zaxEqQQ++yrtqZ0p383uz9xvAsfVwKuEKBcrVAs9naIVOy
         zY9zCYWyr2/2W3R1wfvPOMnlFDThX1eSYGDMIWAhpCytmHsG/qyfhkRxvOARE0bARyW5
         P0+VbeHanxs3ap7Qrna7Ad7NuzjXWZmnjfGGsK0RBf7p2WL93QX6XBbGTJdY8TKj95I6
         TQraY8cvuEDXvyxE0NUvc5WvzKoEn4SrEXphErHpIO7PwjNYUCLvFu1uJ+2UZ7wF8Yxi
         p7b9Dkxqad8CzD3H4PtTyZQxnXPTJRP6uNYww3fZTWq2OjTRoR+H0GTe79ebUetNnRk9
         0LWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@icloud.com header.s=1a1hai header.b=oScEqauw;
       spf=pass (google.com: domain of attorneysogava20@icloud.com designates 17.58.38.49 as permitted sender) smtp.mailfrom=attorneysogava20@icloud.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=pIzEZQtCf/WWWJWXq1lUIHIsKA5YyJp7KWSFqYhp5Uw=;
        b=RRQKvGyiCmQbcxj25kZ2BG1/mLgoG2PiEBiJUmEUJi+xB0pqtg7o1iv+W49f7e9zQy
         MAoKfqrW0Vj3LIa0anStmJ5HO30zPJsvLMWNMuXfNMhCwo6zpW7rd9SWTFbJWTztwrry
         qmAvIhOM2ucPkmegsY4bNxWAzkPUPojepBR5RdxApGub7dMPfw02ugS5DOeNImF1rIi3
         DFLke49yPBdq/0Tae/TEumYY/J5rLZz+xFyMZLPpReWRpGr9ojiWrkwVWdgGrIxx+SCK
         996i0T5WXW7/BADhdZMGD4Q4jUikKyviOTleTdMH3R4HT4ugmFqIifdZgFln/YdgqDyz
         99Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pIzEZQtCf/WWWJWXq1lUIHIsKA5YyJp7KWSFqYhp5Uw=;
        b=L2k40BZWkFHTvzMkmtWFYpHYQ3v6n4+WWGG+ZvBxhfiD2RABaaeYavdEZ/EjoA864S
         9VY96Ao7d+crf2mOs+Zf++UdCy4dYJGIN2O4JeQI8dsXzTon70A9YFdZztTQYv8MbubO
         4L5dbuwb69A9W08ttTRaakcCEXsRZYZt5bta0OG4RIhbsucNGBEyTI1T7ta2Trnsx9yg
         JRtvuUvtSHCBjQLoYbuUg6FmNJV1UBZy4j5ActLOmanPq10gb7HL9+KIpo9v3fTZdyg9
         TFMeZAJCYHPSg3AFHRsAduNXsFoHygYEg0jrt1Vv1G0zkEup37u3u63LfaU28/odcmZk
         /Cog==
X-Gm-Message-State: AOAM532sxdEGhRMe+ywuqzGzQnyVE/8hMkBV1IHnhRXQ3o5kFQgahlx+
	mk23sy7eTmzp/xohE+z0dHI=
X-Google-Smtp-Source: ABdhPJxhAKM3GYcoAvmxrNGQHnfj2i6rDM6UWFPMPN/IAQIaol6or5uGTBWBWQJp1fu4pk0qTlVH8w==
X-Received: by 2002:ac8:7a9a:: with SMTP id x26mr2118468qtr.382.1610409545324;
        Mon, 11 Jan 2021 15:59:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4787:: with SMTP id z7ls272070qvy.7.gmail; Mon, 11 Jan
 2021 15:59:05 -0800 (PST)
X-Received: by 2002:a05:6214:4d4:: with SMTP id ck20mr2019570qvb.54.1610409544905;
        Mon, 11 Jan 2021 15:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409544; cv=none;
        d=google.com; s=arc-20160816;
        b=rGeXH32aM69jBywTcgSsakPX6d2Muf94zgQyy+ojI+Zep1wGfFOEMLocpQRODqEIDQ
         tMX8kitVH851oYjoj3VJt8+vuO5vzBIZYZ25tUDjhfYd5EdDpURR6vVMuIQHYHuU07BI
         cWOPXG4pgTsQOVrg822rGMHkjb2lKp74M5pE1ol8ltGuv5oiAsjVrrIg+txnYhM3oaJd
         kHHIKa3wfkSZhqJ4txeoBcIg+9/ytVkcQdqoYvSv5fd9AZn6mcCzLMErpmegxS3EtcpI
         pVVUGqVUId3jXzXjLf5WmdyfmGFUVRKATBndAi0OIIN1spaVH8a1LP+pxF1d1DpyB2Kn
         xpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:from:dkim-signature;
        bh=IzTOrh33YWb13tHTV6VY8AiL79XXIue0tXqmcr6MrNk=;
        b=nJqqw95PdUXinJrbe+HWYG1KE1lGXwxSFSFoBrFx8Ek+1dwWStw37YDsVmuKWasLx8
         UbIIgHhBnXsvmN97BouLaxaQH8NcKK3OI7bLy6iWONcx6953i9cHJziC7+HsQFpR7l97
         k9byAtHZNhew5sJ/JPNRtY5Oqa1AY61D4XJOKFAMnk9w8qbrXnNG4rG/RAMxp6a/HFtW
         OuPq550kIl9mWcC9p3JojkRfky4doUIHFHUepmygfoUBE5y+SWlh25HIMfvL0/fb9BGo
         g/pRKr/5SLg43SFDIdb6ABe/92GqtGmVhFvSKHSKnD+aO/uuNThCafzUa3gQOUQNSjHj
         RahQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@icloud.com header.s=1a1hai header.b=oScEqauw;
       spf=pass (google.com: domain of attorneysogava20@icloud.com designates 17.58.38.49 as permitted sender) smtp.mailfrom=attorneysogava20@icloud.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=icloud.com
Received: from ms11p00im-qufo17292001.me.com (ms11p00im-qufo17292001.me.com. [17.58.38.49])
        by gmr-mx.google.com with ESMTPS id p55si118970qtc.2.2021.01.11.15.59.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 15:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of attorneysogava20@icloud.com designates 17.58.38.49 as permitted sender) client-ip=17.58.38.49;
Received: from ms11p00im-qufo17292001.me.com (ms11p00im-qufo17292001.me.com [17.58.38.49])
	by ms11p00im-qufo17292001.me.com (Postfix) with ESMTPS id 1BFC91403AB;
	Mon, 11 Jan 2021 23:59:01 +0000 (UTC)
Received: from localhost (ms11p00im-hyfv28254701.me.com [10.9.14.47])
	by ms11p00im-qufo17292001.me.com (Postfix) with ESMTP id CBCB21401FA;
	Mon, 11 Jan 2021 23:59:00 +0000 (UTC)
From: "'sogava lawson' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: sq
Date: Mon, 11 Jan 2021 23:59:01 -0000
X-Mailer: iCloud MailClient2024Project57 MailServer2023B205.10000-Famine2023-0-96a023604b58
Message-id: <7ea20d4e-898c-4bbc-9b85-993a54366b49@me.com>
Content-Type: multipart/alternative; boundary=Apple-Webmail-42--b1e0f229-49e7-4ada-bbae-615d16156c38
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-11_34:2021-01-11,2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=680 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101110137
X-Original-Sender: attorneysogava20@icloud.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@icloud.com header.s=1a1hai header.b=oScEqauw;       spf=pass
 (google.com: domain of attorneysogava20@icloud.com designates 17.58.38.49 as
 permitted sender) smtp.mailfrom=attorneysogava20@icloud.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=icloud.com
X-Original-From: sogava lawson <attorneysogava20@icloud.com>
Reply-To: sogava lawson <attorneysogava20@icloud.com>
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


--Apple-Webmail-42--b1e0f229-49e7-4ada-bbae-615d16156c38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; format=flowed

Lieber Freund,

Bitte entschuldigen Sie, dass Sie Ihre Privatsph=C3=A4re nicht verletzen m=
=C3=B6chten. Ich bin froh, Sie jetzt kontaktieren zu k=C3=B6nnen, um Ihnen =
mitzuteilen, dass mein verstorbener Kunde, der denselben Nachnamen mit Ihne=
n teilt, gestorben ist und einen gro=C3=9Fen Teil des Geldes in der Bank hi=
er in meinem Land.
Ich bin Rechtsanwalt Lawson Sogava. Ich m=C3=B6chte, dass Sie als n=C3=A4ch=
ster Verwandter meines verstorbenen Klienten auftreten, da Sie denselben Na=
chnamen mit ihm teilen. Die Bank hat mir befohlen, die n=C3=A4chsten Angeh=
=C3=B6rigen meines verstorbenen Kunden zu holen, andernfalls werden das Kap=
ital und die Immobilien von der Bank beschlagnahmt. Daher werde ich Ihnen a=
lle notwendigen und rechtlichen Dokumente f=C3=BCr diese Anspr=C3=BCche zur=
 Verf=C3=BCgung stellen

Ich habe Ihnen zuvor eine E-Mail geschrieben, aber keine Antwort
Kommen Sie zu mir zur=C3=BCck, um weitere Informationen / Erkl=C3=A4rungen =
zum Kreditfonds zu erhalten
Vielen Dank f=C3=BCr Ihre Mitarbeit und Ihr Verst=C3=A4ndnis.
Die besten W=C3=BCnsche,
Lawson Sogava (Esq)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7ea20d4e-898c-4bbc-9b85-993a54366b49%40me.com.

--Apple-Webmail-42--b1e0f229-49e7-4ada-bbae-615d16156c38
Content-Type: multipart/related;
    type="text/html";
    boundary=Apple-Webmail-86--b1e0f229-49e7-4ada-bbae-615d16156c38


--Apple-Webmail-86--b1e0f229-49e7-4ada-bbae-615d16156c38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><body><div>Lieber Freund,<br><br>Bitte entschuldigen Sie, dass Sie Ih=
re Privatsph=C3=A4re nicht verletzen m=C3=B6chten. Ich bin froh, Sie jetzt =
kontaktieren zu k=C3=B6nnen, um Ihnen mitzuteilen, dass mein verstorbener K=
unde, der denselben Nachnamen mit Ihnen teilt, gestorben ist und einen gro=
=C3=9Fen Teil des Geldes in der Bank hier in meinem Land.<br>Ich bin Rechts=
anwalt Lawson Sogava. Ich m=C3=B6chte, dass Sie als n=C3=A4chster Verwandte=
r meines verstorbenen Klienten auftreten, da Sie denselben Nachnamen mit ih=
m teilen. Die Bank hat mir befohlen, die n=C3=A4chsten Angeh=C3=B6rigen mei=
nes verstorbenen Kunden zu holen, andernfalls werden das Kapital und die Im=
mobilien von der Bank beschlagnahmt. Daher werde ich Ihnen alle notwendigen=
 und rechtlichen Dokumente f=C3=BCr diese Anspr=C3=BCche zur Verf=C3=BCgung=
 stellen<br><br>Ich habe Ihnen zuvor eine E-Mail geschrieben, aber keine An=
twort<br>Kommen Sie zu mir zur=C3=BCck, um weitere Informationen / Erkl=C3=
=A4rungen zum Kreditfonds zu erhalten<br>Vielen Dank f=C3=BCr Ihre Mitarbei=
t und Ihr Verst=C3=A4ndnis.<br>Die besten W=C3=BCnsche,<br>Lawson Sogava (E=
sq)</div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7ea20d4e-898c-4bbc-9b85-993a54366b49%40me.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/7ea20d4e-898c-4bbc-9b85-993a54366b49%40me.com</a>.<br />

--Apple-Webmail-86--b1e0f229-49e7-4ada-bbae-615d16156c38--

--Apple-Webmail-42--b1e0f229-49e7-4ada-bbae-615d16156c38--

