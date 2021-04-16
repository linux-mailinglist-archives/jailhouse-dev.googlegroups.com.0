Return-Path: <jailhouse-dev+bncBAABB7MV4WBQMGQE5NAEVBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id CB993361B4D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Apr 2021 10:29:49 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id f15-20020adffccf0000b02901028c7339ccsf4096845wrs.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Apr 2021 01:29:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618561789; cv=pass;
        d=google.com; s=arc-20160816;
        b=WlPCOZysCii+LanU8nDvyqjZkOLuqJQSTzSsL0RcCQCv6MUHH4LjV2HzKPZ2QLyOhu
         VGTE/4xw79yX4tlYcHazx/m3pHsjQL8RsrgYpStrDbi0LR6GaOi9NHW4vg/QJQpiBJAS
         BpE5hp1OAG7skepBOxXx40csXVgIneguShVeOQn3pMqV0kNOzYeN5aOBgpUnGIqEBlQO
         oxUU9Rn+Yc3CQgOCUFRBRcbQ5R17H6p6x4cOJKLDqRoHHT4J7hKb4pPbbR13mXVC40WL
         joPxm1Qg65Gdl8YmeTmrAFTVyOWDS8sHUt+PnhB07r+pFLtTCMwc8iHyBYASv75ZJHal
         bTTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=aUBuIsX06HYM9UvoThoeX8c0CAcWqLgezzilDz8uqYw=;
        b=W+xtXdFfXCAa02lP0CjhoIKY4alHRRDGPY7HP88K9Cp7h3b8/xnD+Z5goP04WDnW9G
         HNInRP+8UeV7UX+0EsD+VgXLIdcXlg856k4s6Fr1w7GjqIfQhhOjnPQfE5W+DXSguMpi
         soKSZHmxcJN3Xa5Gl0cCIhVpuNllxkp6qsWBj/CY4pEQE78X1TMvA4fQtNqEi8Baeqd1
         RP2OVhD6pVIjJcECacbq2QjTZDBlzjmbanmFRyjhN+8I05CD6TTdBAWryR+LkmXbDuPF
         RDSpars/02Y9ax8RAz0AXbNhGA5kpJfDfso8EtAUU89sJijDBRtWHhzpuRrqIYVeP0Ye
         5cLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b="k3FzCS/8";
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=EGEC5T4B;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aUBuIsX06HYM9UvoThoeX8c0CAcWqLgezzilDz8uqYw=;
        b=h1Xj+WCoKWfrE1aCILkXfxs8qMT/0E2IcFUKePj1YlV3VH2wD8pYjbcauUkLA42J3o
         gXLlSo2C0YZrtLjfd6Gd8MGJQQ8b7oU7osaMUdMclIuz55T8kOpReSPlpT9+vZ4hcyKc
         mRxeu58rHIAPl4PdgtThoffvbQQNa7CDNEL5O2WAtiCdD+8CFIh3sAwP6nIg68Arhvab
         /fg0nJR3RKThZDwG6cyB5/pCdpcq5ZlxVIvqw3PMYVK+iiJZMLl93pBBE1Mcl2f8u+m2
         28t2dy0mPsDI+Nl5qclS/tUbZ6TrflzjVfneXnGHlujEbfwjM9BKbWg9MfSzTx7w2+Yj
         UEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aUBuIsX06HYM9UvoThoeX8c0CAcWqLgezzilDz8uqYw=;
        b=uNN/nDnmlQpxmA+nt4VKoWP0uJtuac/yvkeC1WHnR/XhQ48bV+w8Kgn/3K+43K9omL
         fMRVBimB0krkO7tv8xwB4UJjIFhK7iR+vOMJIeGLrc0a2vtHWtwnXuWawWpp4fGg0dqv
         40/Z+skcOpqxzV5pdtl9KezlL2fPbhBF0FLS5+NL131xPHqsA2wpFz3rxdWfk6Kv9EnP
         kNzUUlMtyZPj1Kux9JUPJNY20yT0der3TNp93ZkMU024ru5Vm3nUU5DreDKhCrgRistW
         8EtsZvH5kq3PmhKf8KbEAZpZ540lpb5k9VUgGpqgvQ4pzY2eK33QzC7UrATPgiC1wDJ4
         BQ9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Z8Gxh8bC9hSrn4gUd7wSWoB9oL+Wb72g2SPSydiHC5yHlc1ja
	l206Sxg6PS3QXbU2lzvP9lc=
X-Google-Smtp-Source: ABdhPJwSnJQasr29XYxu1g2+zDpHdscOfo2xI0YwfYNbfYIeS+joJbpzkDBqdb/1BMVzYfCeM45QBQ==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr7816923wru.157.1618561789504;
        Fri, 16 Apr 2021 01:29:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c205:: with SMTP id s5ls4018056wmf.3.canary-gmail; Fri,
 16 Apr 2021 01:29:48 -0700 (PDT)
X-Received: by 2002:a1c:730a:: with SMTP id d10mr6845056wmb.43.1618561788589;
        Fri, 16 Apr 2021 01:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618561788; cv=none;
        d=google.com; s=arc-20160816;
        b=vXyxyz2TT0EXL3nN70HYzQJj3wIeC4LP4nCnj3II+TmaCSqSSBC/3t8K558ltLGPsg
         luXkJJO0uuNPft3R3TSADmoRUlIpjo8uCAOZKZwbTrBB+SRUeWH5NjkYRopIN8vozQZY
         Sfs/WPDYjC90eYj0TWezig873X/NhtNumOLpauUO+adR+wbiukBxoRVO31mHHz42MqJL
         +TiZKzI213sNS72wm/3+aLOIrBKxX9u6Cl4uWuFpyXR2uUlXQKaGDN7/6qF/n0qtbw8G
         lQRVKiPO1kZwfQQ8zFWeR2fbXjwr0Gj9a1GGoWoM4L+FvXuqsD2K0y2qNEjUIHNK8Pwx
         OxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature
         :dkim-signature;
        bh=ETZY9GUIUVkHwoJvQbXpGlAq9IYNVKlTyO7dQmMVDi8=;
        b=dRMiM/Jh/nZre/qJ2N7cGZVt1e27wScgOaxs9T2MilyV/wbcr66g0I66E5SnG8U36R
         91j58KDHdt/ALnLufJNma/6fAQQ3OoA1gi9ceGLchjOS0eviYysIzxi+Lrh++ycogIht
         lQHgdJaiA1WK9xG5yse2peTjshdFlYHsPJFdUqV6kJzFk9L6AlNMMTxqbEYMSzBohi8e
         fYgfwn3VGONqWxpSLkTakonJ4/IHDk+wk0PtuzNGfq0nM4TnjHnipp4ss5Lon9XNcnTo
         Cim3oJInt7cc6v3kSv631ugmf6OmkvT/tuKT6dAivs2WhdR7GCjQ3QbVbLAjrhnFXvF3
         xqxQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b="k3FzCS/8";
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=EGEC5T4B;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id a4si259915wrc.0.2021.04.16.01.29.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Apr 2021 01:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.83 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Fri, 16 Apr 2021 08:29:43 GMT
Received: from email1.uni-rostock.de (139.30.22.81) by email3.uni-rostock.de
 (139.30.22.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Fri, 16 Apr 2021
 10:29:43 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0792.013; Fri, 16 Apr 2021 10:29:43 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Inquiry
Thread-Topic: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpg==
Date: Fri, 16 Apr 2021 08:29:42 +0000
Message-ID: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.79.188]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26094.006
x-tm-as-result: No-10--20.519600-8.000000
x-tmase-matchedrid: s5S+yaENp+gWnb/hfLnEiP0peXGEEBlvDvKSaIxu6kpXG3yI9k2vbIfN
	L7D/HMEOKHWHnxIi33mD28NNt7xCyCkBeV/1d1sZ30kDaWZBE1TQTttTsZbKLwcR01yaR+FBUh2
	2S5Tkcs//ENcaY0e0P1DQ43dkW3a5LDC3FGTHI3eL6bUMM+bbIiUnLzk1+IxzKxnRjlf7+Wumwy
	TaqTyZMcmQWCAFxn4DDA8Wn3vJOMCTSLvqtArOktqLN7nigLBUVBPjB/Of+FQDwV9jYWbSU6w5A
	BQh6E8WCeJX3ocWb+MhLHn0oWpP11Oi9a5lapaRDrDTQZ5YEVrrixWWWJYrH0OrZJUSTvYobh2N
	Zp6L5YQvM/mydp5vVH6pZDLwULsykazyAXiEv2uKuB/TJU7aiTukgkp8HKxisi4FfqP2aTUNHPF
	TGPA2lA==
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--20.519600-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26094.006
x-tm-snts-smtp: 7CF18AE4A898F4C8B28696D0237BC11A486591126644BEF59FCA8C1F551860A42002:8
Content-Type: multipart/alternative;
	boundary="_000_0631a4941db6453491ffecf6c08b1cf7unirostockde_"
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.s=itmze header.b="k3FzCS/8";
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=EGEC5T4B;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de
 designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
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

--_000_0631a4941db6453491ffecf6c08b1cf7unirostockde_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


To whom it may concern,
I am a Master student in Rostock University and I am studying Jailhouse thi=
s semester as a Master project and I would like to gather information about=
 this Hypervisor, as well as I would like to ask, whether it is possible to=
 install it on an Ubuntu Virtual Machine? I just need an outline, how I can=
 learn it. I spent today reading the code on GitHub, but I need more inform=
ation and appreciate it if you can help me.
Thanks in advance
Moustafa Noufale

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0631a4941db6453491ffecf6c08b1cf7%40uni-rostock.de.

--_000_0631a4941db6453491ffecf6c08b1cf7unirostockde_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-MailFormatvorlage18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify">To whom it may concern,=
 <br>
I am a Master student in Rostock University and I am studying Jailhouse thi=
s semester as a Master project and I would like to gather information about=
 this Hypervisor, as well as I would like to ask, whether it is possible to=
 install it on an Ubuntu Virtual
 Machine? I just need an outline, how I can learn it. I spent today reading=
 the code on GitHub, but I need more information and appreciate it if you c=
an help me.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify">Thanks in advance<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify">Moustafa Noufale<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0631a4941db6453491ffecf6c08b1cf7%40uni-rostock.de?=
utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/j=
ailhouse-dev/0631a4941db6453491ffecf6c08b1cf7%40uni-rostock.de</a>.<br />

--_000_0631a4941db6453491ffecf6c08b1cf7unirostockde_--

