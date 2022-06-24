Return-Path: <jailhouse-dev+bncBAABB7VL2WKQMGQEXCRITPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x139.google.com (mail-il1-x139.google.com [IPv6:2607:f8b0:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B455932F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Jun 2022 08:13:20 +0200 (CEST)
Received: by mail-il1-x139.google.com with SMTP id g9-20020a056e020d0900b002d958b2a86dsf812050ilj.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jun 2022 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version:thread-index
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2irmUCIn/u2iY7gfSBZzacV0Iw99VuB/rKj7/39AodU=;
        b=DAU5zsX0xcUifIy3HYiGfRQ0WnYGPwD2rlWshLNRjWi2KAdGipiyx2j7GM/oAPB4qS
         NvaPnJInIjRswYL0cn63VKuZKjDjNnaP3jgoBJieaE4R/ioYodYGvYX9DWzmfc8S4Olh
         5nQKBBFoqYx8L0oBD1EBxl0rfEL1L1coKHz+z3xgDA70zyyWm47vErOTOQjbIb5VuFoa
         AE/aXuj+AmeWQe47RZ4qYPNgJHJW8OF3kBq9h3SEP717CMWtIsQj5CQTPXbAo1xLhnV5
         xskXUVq766YCX3XXab+alTTm9vDWsa3b83zpCDDlKiH/x8ChfFl015D6nqlzpEF58SvE
         CloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:thread-index:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2irmUCIn/u2iY7gfSBZzacV0Iw99VuB/rKj7/39AodU=;
        b=lSW0wnYoSBu5jV7dVmc0JcAS4tW56XYizsbfRKVM8c2esg9r2zDi5lDIuxBQ0VMCUG
         84V3qgNND9HRXsCXoTWBih1z77KCdWhP72KdsUJz5JZsDNc1hAHtG2et7dArIR+SS0sb
         BigzLHWNKvqEkVf1/WUld1NHECGrlXRIVYQrlHyiKTdFIVqEi+CLLK8aM5dy3Ox40PWY
         XUMgv5Kz9xIEvM15f2MuRWCjJVg9pe50G4zNrjTquQJOvicbI2Ydniee77yf9VZjW3SB
         PuWLcVeW2ENInoAi/mO4whomfmG7f8KArObqz0BSc59Ej9BEm5pCWteBXCcxCfTXZqbw
         rpwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+rN8sHhem2D3J8PZRwSqXk3eWKfzy52p1Fl6RGK3eokd5SBC0y
	rRorK1qONCPkR5/pOXsTEvs=
X-Google-Smtp-Source: AGRyM1syCMElELj4PWohZF2Twf9H4byARk4h1UqFoTvvqdpyilsKsTp87Kqn91fjfn7wMhCVQBwWbA==
X-Received: by 2002:a05:6e02:1083:b0:2d9:2241:3e18 with SMTP id r3-20020a056e02108300b002d922413e18mr7285865ilj.93.1656051199250;
        Thu, 23 Jun 2022 23:13:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:3816:b0:339:bc15:d225 with SMTP id
 i22-20020a056638381600b00339bc15d225ls2063433jav.6.gmail; Thu, 23 Jun 2022
 23:13:18 -0700 (PDT)
X-Received: by 2002:a05:6638:3a0a:b0:339:ec66:febd with SMTP id cn10-20020a0566383a0a00b00339ec66febdmr3596564jab.313.1656051198659;
        Thu, 23 Jun 2022 23:13:18 -0700 (PDT)
Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net. [23.83.212.46])
        by gmr-mx.google.com with ESMTPS id u10-20020a92ccca000000b002d3c49040dasi60813ilq.5.2022.06.23.23.13.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2022 23:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jennifer@targetassistantinc.com designates 23.83.212.46 as permitted sender) client-ip=23.83.212.46;
X-Sender-Id: hostingeremail|x-authsender|jennifer@targetassistantinc.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E42F06C1948
	for <jailhouse-dev@googlegroups.com>; Fri, 24 Jun 2022 06:13:16 +0000 (UTC)
Received: from gcp-asia-southeast1-c-smtpout2.hostinger.io (unknown [127.0.0.6])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E47806C1A5C
	for <jailhouse-dev@googlegroups.com>; Fri, 24 Jun 2022 06:13:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1656051196; a=rsa-sha256;
	cv=none;
	b=PLuuuyYOlPXuIGDum08i+KX4fZhwfQ+smWcxRr9DNVlz3Y0N/rarwbtH4jZVOCfpjLfy1h
	L/b54du5gYdhTAYM9nSGe5b7dXNNCKoqdIEGehF0E7kns45KQsbPs1NjqeTpZJREbtXNlE
	u9Bq3uFFkFnF0wNKC2ZBgRbm4Cs0c2FMEasD2a4yr9W2o2so5y+NBe+3HmEV7YQCYT8yhE
	V4RQnqmqZXmdbdPlBgxhtV5G1Sh2FQmtYFhsQ7x5kEoq8FjkmB+9bbURB8aJudATB+XdWB
	GREyDT9levlGWbYcfDFrQnvCi+g+Gd0yctltL/NKJk71hUyVYgXtS+rBS+XuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1656051196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=puHAPmfYfZN1Mm2GbI91W04pbggP4k44MacTfSSAyS0=;
	b=wfinr+fxfgKpbwIbEthwqduQtUs1fbr5qDvuY02Nc4T1ns87TGDgDiOfMwDIe7lnNSyMYO
	sMtbVoAgFClTmJNDncYFY4qXrfGv8oPTXCv6NtvdFoBRxzJIDx4nqNQFuMcL7+n25QcMEt
	2LNThJOWK5MQcXnoexBbLKtXbPC/DXutpqpsA4Fh96B/nh0ZXX0J2ct1iMNNmtSFdixWI1
	f2WcCBksVunZ8CdKMYKZHbl8w1mh0QN+OJNG0DgmzCFgHlGUYzuTLycVWM5GSbR13IBOWX
	BSdGvASjyp2+rHHSrHBGHl7SgQ6YXJAtnw5CVCgIomzNXCBiJjVQulqIVcFA7g==
ARC-Authentication-Results: i=1;
	rspamd-848669fb87-fznr6;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=jennifer@targetassistantinc.com
X-Sender-Id: hostingeremail|x-authsender|jennifer@targetassistantinc.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authsender|jennifer@targetassistantinc.com
X-MailChannels-Auth-Id: hostingeremail
X-Daffy-Duck: 165b36f30d5e43ac_1656051196731_1560452841
X-MC-Loop-Signature: 1656051196731:2150467604
X-MC-Ingress-Time: 1656051196731
Received: from gcp-asia-southeast1-c-smtpout2.hostinger.io
 (gcp-asia-southeast1-c-smtpout2.hostinger.io [34.87.76.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256)
	by 100.125.123.1 (trex/6.7.1);
	Fri, 24 Jun 2022 06:13:16 +0000
Received: from DESKTOP11LO885 (unknown [IPv6:2401:4900:3365:fcdf:746f:d1b4:8a9c:7a86])
	(Authenticated sender: jennifer@targetassistantinc.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4LTmyK6ZZxz7X3Vh
	for <jailhouse-dev@googlegroups.com>; Fri, 24 Jun 2022 06:13:13 +0000 (UTC)
From: "Jennifer Shrader " <jennifer@targetassistantinc.com>
To: <jailhouse-dev@googlegroups.com>
Subject: SEMICON West 2022 - Attendees List
Date: Fri, 24 Jun 2022 11:43:12 +0530
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAADja7PgzxmpLozcvupu0atzigAAAEAAAALY+ursWb+1Bk42CqY9+9VcBAAAAAA==@targetassistantinc.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0E9B_01D887BF.9679FD30"
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdiHkXtdtwiBklKFRouVMe6AmM8sug==
Content-Language: en-in
X-Original-Sender: jennifer@targetassistantinc.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@targetassistantinc.com header.s=hostingermail-a header.b=HUiaWfru;
       arc=fail (body hash mismatch);       spf=pass (google.com: domain of
 jennifer@targetassistantinc.com designates 23.83.212.46 as permitted sender) smtp.mailfrom=jennifer@targetassistantinc.com
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

This is a multipart message in MIME format.

------=_NextPart_000_0E9B_01D887BF.9679FD30
Content-Type: text/plain; charset="UTF-8"

Dear Exhibitor,

 

This is to inform you that attendees-list of show SEMICON West 2022|CONNECTS
THE ENTIRE EXTENDED ELECTRONICS SUPPLY CHAIN INDUSTRY. is available with
Contact Name, Company Name, Company URL, Title/Specialty, and verified Email
address, Physical Address, Phone Number, Fax Number, Industry, Employee Size
and Revenue Size etc.

 

Total Contacts:18000

 

Please review & let me know if you are interested so that I can send you the
cost and other information

 

Best Regards,

Jennifer Shrader

Demand Generation Executive

 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/!%26!AAAAAAAAAAAYAAAAAAAAADja7PgzxmpLozcvupu0atzigAAAEAAAALY%2BursWb%2B1Bk42CqY9%2B9VcBAAAAAA%3D%3D%40targetassistantinc.com.

------=_NextPart_000_0E9B_01D887BF.9679FD30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=
=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 (filtered =
medium)"><style><!--
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-=
US style=3D'color:#1F497D'>Dear Exhibitor,<o:p></o:p></span></p><p class=3D=
MsoNormal style=3D'text-indent:36.0pt'><span lang=3DEN-US style=3D'color:#1=
F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'color:#1F497D'>This is to inform you that attendees-list of <b>sho=
w SEMICON West 2022|CONNECTS THE ENTIRE EXTENDED ELECTRONICS SUPPLY CHAIN I=
NDUSTRY. </b>is available with Contact Name, Company Name, Company URL, Tit=
le/Specialty, and verified Email address, Physical Address, Phone Number, F=
ax Number, Industry, Employee Size and Revenue Size etc.<b><o:p></o:p></b><=
/span></p><p class=3DMsoNormal style=3D'text-indent:36.0pt'><span lang=3DEN=
-US style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><b><span lang=3DEN-US style=3D'color:#1F497D'>Total Contacts:</span></b><=
span lang=3DEN-US>18000<b><span style=3D'color:#1F497D'><o:p></o:p></span><=
/b></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'color:#1F497=
D'>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US styl=
e=3D'color:#1F497D'>Please review &amp; let me know if you are interested s=
o that I can send you the cost and other information</span><span lang=3DEN-=
US><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp=
;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'color:#1=
F497D;mso-fareast-language:EN-IN'>Best Regards,<o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US style=3D'color:#1F497D;mso-fareast-langua=
ge:EN-IN'>Jennifer Shrader<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'color:#1F497D;mso-fareast-language:EN-IN'>Demand Gene=
ration Executive<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US><o:p>&nbsp;</o:p></span></p></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/!%26!AAAAAAAAAAAYAAAAAAAAADja7PgzxmpLozcvupu0atzig=
AAAEAAAALY%2BursWb%2B1Bk42CqY9%2B9VcBAAAAAA%3D%3D%40targetassistantinc.com?=
utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/j=
ailhouse-dev/!%26!AAAAAAAAAAAYAAAAAAAAADja7PgzxmpLozcvupu0atzigAAAEAAAALY%2=
BursWb%2B1Bk42CqY9%2B9VcBAAAAAA%3D%3D%40targetassistantinc.com</a>.<br />

------=_NextPart_000_0E9B_01D887BF.9679FD30--

