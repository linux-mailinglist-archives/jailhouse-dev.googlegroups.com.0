Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBTNNY6YAMGQE24L7HLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD489ADA0
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:12:15 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dc693399655sf5860906276.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445134; x=1713049934; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNHlgXWUQgJSfaZxf5QfLrLXqaVl9rKYOVrqWJ0EAnw=;
        b=AhU6CH6iKoC7TreXdFBKp0G+LWWFX+vGVKcMlCbgA+wYQT0siULlZZIZ2a3A0+1yaS
         lvlFwPv2rIoPS0/ZB+foBG6CSwRL8psh58/uIvDM0QxJNHgtReQx0oDVhrck8WA6A1wl
         47ce2Xvw3pGvL7QQ3EeRfk63vSk8KfTyet4gKbfnXsNvv1Wu1y0NwGMp5TWBTxdNKyvF
         XcyBH05T9kXX3KNTFEWc3PMOolF/iwW+DGtVyVILagWPeZbIFPVURBe46cQ8iCiF0TQv
         SsrmcNfRUPlRcq/EZZXYhwQfaE0LecdcdHkN0QJqHQTqo3djXq/bp/oWGdwLV4QoVgTC
         pboA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445134; x=1713049934; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNHlgXWUQgJSfaZxf5QfLrLXqaVl9rKYOVrqWJ0EAnw=;
        b=dsb+AZcM29ymLTGYxW2qGSeT1dx/9yp+RjD5tKcmSKr4l9465AHF49HUtjYjNLgQIV
         qNolszTQADjtKSGrU1H0yaBOq4OcRLWQxx7M69ck6DJs2tf0dKVfIpJdIpPebM/PY3ZN
         PMhh5X8Puhiv88446M9GK9b0vOU7pGSM/RJBH8XsxjE9BJEyKUAU7FNYAoYQm+2YIAey
         gbygck5cyZWmnmSjTlM5O/vDcpiZ3E8eJoNoBKSLxXZlPzciJv4Wq3Kyvbm6r6Ppa6EV
         r7sy8IIgHa28hJrjMszp4BA6+UxZZBVzKMxiFB7tPPk+3hQPLgF0SF9giVtBLZpitxH8
         ilZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445134; x=1713049934;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNHlgXWUQgJSfaZxf5QfLrLXqaVl9rKYOVrqWJ0EAnw=;
        b=cxKQ4GBV2ENEETB5wUk/LvMc/uep8l2zXF2OJa2cbTREri7ABawdjXdD/PS/dcN7zc
         7lNK6/MXx+27ulnC88+UDbi6NJZ9pakNgmkZhE4WdIVYcNKeE7VzSYbbqAkriFUbDy+6
         gse7S8BomFMgHFI0CILu2UvExmzPM+rxyDPwKAjbggTZi//sfriecaiZalwmzjTtV8vG
         EtnaVN8V3rzJSO2U5ClyLwWzi/7/trnozI/AgE6eAHkEcyGdGjPlPjupqf9j1W5ej2Aa
         jAQwEuYmWUGDViT5Mo5zHzDmAhWKn1bGkPMgZxLUnt8MUnXvZutKPwQRRRy8PPMBVLNL
         X8PA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU1zKxxi0jiZ+hqwx1VlMDZpXcuHgeF0m3xIUPH0VIXQ2TuGj1QLKdcoSmD42v2lF/Z1GqppZaPAN4txnbcaVyAwlBd1JJINm8Mp7w=
X-Gm-Message-State: AOJu0Ywc0qj/IIW5EolZj3iPO7LZalu8JBLllV/Y/L8DnZ62zyK3Cgwm
	qOvrlnVuzf9IDf6C64qiI0RZqIDKnBCONafpiC/UlV03Pyk49KQL
X-Google-Smtp-Source: AGHT+IHtIuKYw20SLXs7dFyL4DEgjJ7hwvTqJVgeekO2qs/1TGoYd0rSsXo6EakxqqzsAg7EuJd4IQ==
X-Received: by 2002:a25:ae66:0:b0:dc7:8c3a:4e42 with SMTP id g38-20020a25ae66000000b00dc78c3a4e42mr4035788ybe.30.1712445133812;
        Sat, 06 Apr 2024 16:12:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7203:0:b0:dcc:717f:41b7 with SMTP id n3-20020a257203000000b00dcc717f41b7ls4284096ybc.0.-pod-prod-07-us;
 Sat, 06 Apr 2024 16:12:12 -0700 (PDT)
X-Received: by 2002:a0d:e251:0:b0:615:134c:7ef3 with SMTP id l78-20020a0de251000000b00615134c7ef3mr1348038ywe.9.1712445131786;
        Sat, 06 Apr 2024 16:12:11 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:12:11 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c18dff65-3ac9-45fe-abee-5ff7084524c1n@googlegroups.com>
In-Reply-To: <65c5f41e.050a0220.c8314.2afe@mx.google.com>
References: <65c5f41e.050a0220.c8314.2afe@mx.google.com>
Subject: Re: ARTIIS 2024 CFP - Santiago de Chile, Chile - Hybrid format -
 Indexed by Scopus
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_258930_904872681.1712445131074"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_258930_904872681.1712445131074
Content-Type: multipart/alternative; 
	boundary="----=_Part_258931_79556839.1712445131074"

------=_Part_258931_79556839.1712445131074
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Friday, February 9, 2024 at 12:28:38=E2=80=AFPM UTC+1 ARTIIS Team wrote:

>  =20
>
>               =20
>
> International Conference on Advanced Research in Technologies,=20
> Information, Innovation and Sustainability (ARTIIS 2024)      =20
>
>
>  =20
> CALL 4 PAPERS Deadline May 20             =20
>
>                  *Hybrid format*
>
> Indexed by Scopus=20
>            *https://www.artiis.org/ * <https://www.artiis.org/>        =
=20
>
>      =20
>
> Dear Researcher
>
> We cordially invite you to participate in International Conference on=20
> Advanced Research in Technologies, Information, Innovation and=20
> Sustainability (ARTIIS 2024), at *Universidad Andr=C3=A9s Bello*, to be h=
eld=20
> on October 21-23, *Santiago de Chile*, *Chile*.=20
>
> The conference will be in a hybrid format (in-Person and Virtual).
>
> Main conference and Special Sessions  Proceedings will be published with*=
 Springer=20
> in their Communications in Computer and Information Science series (CCIS)=
*
>  with Springer. CCIS is abstracted/indexed in DBLP, Google Scholar,=20
> EI-Compendex, SCImago, Scopus. CCIS volumes are also submitted for=20
> inclusion in ISI Proceedings. Last ARTIIS CCIS Proceedings=20
> <https://link.springer.com/conference/artiis>.
>
> Submitted papers should be related to one or more of the main themes=20
> proposed.
>
> *1. Computing Solutions*
> - Applied Information Systems (e. g. Healthcare, Law, Economics, Educatio=
n)
> - Web and Mobile Applications
> - Networks, Mobility, Ubiquity and Pervasive Systems
> - Innovative Computing
> - Gamification Application and Technologies
> - Software Engineering
>
> *2. Data Intelligence*
> - Advanced Computational Intelligence
> - Computer Vision and Image Processing
> - Artificial Intelligence and Data Science
> - Data Engineering, Analytics, and Applications
> - Intelligent and Decision Support Systems
> - Information and Knowledge Management
>
> *3. Sustainability*
> - Immersive Tech and the Future of Smart Cities
> - Industrial Advanced Internet of Things
> - Internet of Things Environment
> - Sustainable Infrastructure Development
> - Technology, Marketing and Socio-economic challenges
>
> *4. Ethics, Security, and Privacy*
> - Information and Telecommunication Systems Security
> - Innovative Communication Networks and Security
> - Vulnerabilities of Interoperability and Information system
> - Interdisciplinary Information Studies
> - Ethics of Social Sciences for Computer Applications
>
>
>   *Beyond the Main Conference ARTIIS 2024 there are several Special=20
> Sessions*:
>
>    - *ACMaSDA 2024*:Applications of Computational Mathematics to=20
>    Simulation and Data Analysis
>    - *CICITE **2024*:Challenges and the Impact of ICT on Education
>    - *GAT **2024*: 2nd Workshop on Gamification Application and=20
>    Technologies
>    - *ISTIIS **2024**: International Symposium on Technological=20
>    Innovations for Industry and Society*
>    - *ISHMC **2024*: Intelligent Systems for Health and Medical Care
>    - *SMARTTIS 2024*: Smart Tourism and Information Systems
>    - *ET-AI 2024*: Emergent Technologies and Artificial Intelligence
>    - *IWET 2024*: International Workshop on Electronic and=20
>    Telecommunications
>    - *TechDiComM 2024*: Technological Strategies on Digital Communication=
=20
>    and Marketing
>    - *glossaLAB 2024:* Bridging Knowledge in a Fragmented World
>    - *#RTNT 2024:* Emerging Technologies to Revitalize Tourism
>    - *CICT 2024*: Cybersecurity in Information and Communication=20
>    Technologies
>    - *WIN-WIN-4S 2024*: Workshop on IoT Networks and Wireless for=20
>    sustaINability
>   =20
>
> *Selected papers will be invited to publish an extended version in:*
>
>
>    - SN Computer Science <https://www.springer.com/journal/42979>,=20
>    Springer and Nature
>    - *Computation <https://www.mdpi.com/journal/computation>*, MDPI
>    - EAI Endorsed Transactions on Smart Cities=20
>    <https://l.facebook.com/l.php?u=3Dhttps%3A%2F%2Feudl.eu%2Fjournal%2Fsc=
%3Ffbclid%3DIwAR0cN29XwFNcdbsI6V0ZEbSF6PY2MsJOGZAymgMCUEcCIObnOBfq1UK68O8&h=
=3DAT3KIMbGL2GxfHWsUCpYK4Y1ncg7Yxt_FbVwHSoOf7I7EQpp_68wfZYSfpoAL69BtFA0ojGQ=
1cLMACY9L0hM-YHPH5dqorfKP_iuzzXxC6qeER3GjsRvseOvGlFQB5jNepA>,=20
>    open access, peer-reviewed scholarly journal, EAI=20
>   =20
>
> *We are waiting for you!*
>
>
> For more information Artiis.org
>
>
> Kind Regards
>
> ARTIIS Team=20
>             =20
>  =20
>
>  =20
>
>
> website *ARTIIS.ORG* <https://www.artiis.org/about>
>
> =20
>         =20
>
>                          =20
>
>  =20
>                                                              =20
>
>  =20
>
> You can Unsubscribe by email from this mailing list=20
>
>  =20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c18dff65-3ac9-45fe-abee-5ff7084524c1n%40googlegroups.com.

------=_Part_258931_79556839.1712445131074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Friday, February 9, 2024 at 12:28:38=E2=80=AFPM UTC+1 ARTIIS Team wrote:<b=
r/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
    =09
    =09
    =09
=09

	<div style=3D"margin:0px;padding:0px;width:100%;color:rgb(96,96,96);font-f=
amily:Arial,sans-serif;font-size:14px;background-color:rgb(234,234,234)" bg=
color=3D"#eaeaea">
		<table width=3D"100%" height=3D"100%" style=3D"margin:0px;padding:0px;bor=
der:0px currentColor;width:100%;color:rgb(96,96,96);font-family:Arial,sans-=
serif;font-size:14px;border-collapse:collapse;border-spacing:0;background-c=
olor:rgb(219,220,208)" bgcolor=3D"#dbdcd0" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0">
			<tbody>
				<tr>
					<td align=3D"center">
					=09
						<table width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0">
							<tbody>
							=09
								<tr>
									<td width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0">
										<table width=3D"600" align=3D"center" style=3D"padding:0px;border=
:0px currentColor;width:600px;border-collapse:collapse;border-spacing:0;bac=
kground-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0">
											<tbody>
												<tr>
													<td width=3D"600" align=3D"left" style=3D"margin:0px;padding:0=
px;border:0px currentColor;width:600px;border-collapse:collapse;border-spac=
ing:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
														</p>
														<p align=3D"center" style=3D"margin:0px;padding:0px;color:rgb=
(255,255,255);line-height:16px;font-family:Arial,sans-serif;font-size:14px"=
><font size=3D"4"><strong>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0	</strong></font></p><p align=3D"center" style=3D"margin:0px;paddi=
ng:0px;color:rgb(255,255,255);line-height:16px;font-family:Arial,sans-serif=
;font-size:14px"><font size=3D"4">International Conference on Advanced Rese=
arch in Technologies, Information, Innovation and Sustainability (ARTIIS 20=
24)</font>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	</p><p align=3D"center" styl=
e=3D"margin:0px;padding:0px;color:rgb(255,255,255);line-height:16px;font-fa=
mily:Arial,sans-serif;font-size:14px"><br></p>
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							=09
							=09
								<tr>
									<td width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0">
										<table width=3D"600" height=3D"120" align=3D"center" style=3D"mar=
gin:0px;padding:0px;border:0px currentColor;width:600px;height:120px;border=
-collapse:collapse;border-spacing:0;background-color:rgb(255,255,255)" bgco=
lor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" valign=3D"=
middle">
											<tbody>
												<tr>
													<td width=3D"200" height=3D"120" align=3D"left" valign=3D"midd=
le" style=3D"margin:0px;padding:0px;border:0px currentColor;width:200px;hei=
ght:120px;border-collapse:collapse;border-spacing:0;background-color:rgb(25=
5,255,255)" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0">
														<span style=3D"margin:0px;padding:0px;color:rgb(147,202,29);t=
ext-transform:uppercase;line-height:24px;font-family:Arial,sans-serif;font-=
size:20px;font-weight:bold">
															<a style=3D"margin:0px;padding:0px;color:rgb(147,202,29);tex=
t-transform:uppercase;line-height:24px;font-family:Arial,sans-serif;font-si=
ze:20px;font-weight:bold;text-decoration:none" rel=3D"nofollow">
<span style=3D"margin:0px;padding:0px;color:rgb(147,202,29);text-transform:=
uppercase;line-height:24px;font-family:Arial,sans-serif;font-size:20px;font=
-weight:bold">CALL 4 PAPERS Deadline <font color=3D"#ff8000">May=C2=A020</f=
ont>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0	</span>
															</a>
														</span>
													</td>
													<td width=3D"400" height=3D"120" align=3D"right" valign=3D"mid=
dle" style=3D"margin:0px;padding:0px;border:0px currentColor;width:400px;he=
ight:120px;border-collapse:collapse;border-spacing:0;background-color:rgb(2=
55,255,255)" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><p>
														<span style=3D"margin:0px;padding:0px;color:rgb(147,202,29);l=
ine-height:24px;font-family:Arial,sans-serif;font-size:20px">
															<a style=3D"margin:0px;padding:0px;color:rgb(147,202,29);lin=
e-height:24px;font-family:Arial,sans-serif;font-size:20px;text-decoration:n=
one" rel=3D"nofollow">
																<span style=3D"margin:0px;padding:0px;color:rgb(147,202,29)=
;line-height:24px;font-family:Arial,sans-serif;font-size:20px">
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0	<font color=3D"#004080" size=3D"3"><strong>Hybrid for=
mat</strong></font></span></a></span></p><p align=3D"right"><span style=3D"=
margin:0px;padding:0px;color:rgb(147,202,29);line-height:24px;font-family:A=
rial,sans-serif;font-size:20px"><span style=3D"margin:0px;padding:0px;color=
:rgb(147,202,29);line-height:24px;font-family:Arial,sans-serif;font-size:20=
px"><font color=3D"#0080ff">Indexed by Scopus</font></span>
														=09
														</span>
													</p></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							=09
							=09
								<tr>
									<td width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(231,134,13)" bgcolor=3D"#e7860d" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
										<h1 style=3D"margin:0px;padding:0px;color:rgb(255,255,255);line-h=
eight:24px;font-family:Arial,sans-serif;font-size:20px"><em>
</em><em><img width=3D"589" height=3D"256" align=3D"baseline" style=3D"widt=
h:641px;min-height:279px" alt=3D"" src=3D"https://groups.google.com/group/j=
ailhouse-dev/attach/c168fac7cb50/ARTIIS2024-O.png?part=3D0.1&amp;view=3D1" =
border=3D"0" hspace=3D"0">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0	</em><a href=3D"https://www.artiis.org/" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://www.artiis.org/&amp;source=3Dgmail&amp;ust=3D1712531440777000=
&amp;usg=3DAOvVaw3S_Gr2SBNoCPCQ7frYgXZz"><font color=3D"#ffffff"><font size=
=3D"2"><em>https://www.artiis.org/=C2=A0</em></font></font></a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	</h1>
									</td>
								</tr>
							=09
							=09
								<tr>
									<td width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0">
										<font color=3D"#000000">
													</font><font color=3D"#000000" size=3D"2">
												</font><font color=3D"#000000" size=3D"2">
												</font><font color=3D"#000000" size=3D"2">
													</font><table width=3D"600" align=3D"center" style=3D"margin:0=
px;padding:0px;border:0px currentColor;width:600px;border-collapse:collapse=
;border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" bo=
rder=3D"0" cellspacing=3D"0" cellpadding=3D"0">
											<tbody>
											=09
												<tr>
												=09
													<td width=3D"430" height=3D"50" style=3D"margin:0px;padding:0p=
x;border:0px currentColor;width:430px;height:50px;border-collapse:collapse;=
border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0"><p>
														=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0</p><font color=3D"#000000" size=3D"2"><p style=3D"=
color:rgb(96,96,96);text-transform:none;text-indent:0px;letter-spacing:norm=
al;font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-weigh=
t:400;word-spacing:0px;white-space:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;text-decoration-style:initial;text-decoration-color:i=
nitial"><font color=3D"#000000" size=3D"2">Dear Researcher</font></p><p ali=
gn=3D"justify" style=3D"color:rgb(96,96,96);text-transform:none;text-indent=
:0px;letter-spacing:normal;font-family:Arial,sans-serif;font-size:14px;font=
-style:normal;font-weight:400;word-spacing:0px;white-space:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;text-decoration-style:initial=
;text-decoration-color:initial"><font color=3D"#000000"><font size=3D"2">We=
 cordially invite you to participate in International Conference on Advance=
d Research in Technologies, Information, Innovation and Sustainability (ART=
IIS 2024), at<span>=C2=A0</span><strong>Universidad Andr=C3=A9s Bello</stro=
ng>, to be held on October 21-23,<span>=C2=A0</span><strong>Santiago de Chi=
le</strong>,<span>=C2=A0</span><strong>Chile</strong>.</font>=C2=A0</font><=
/p><p align=3D"justify" style=3D"color:rgb(96,96,96);text-transform:none;te=
xt-indent:0px;letter-spacing:normal;font-family:Arial,sans-serif;font-size:=
14px;font-style:normal;font-weight:400;word-spacing:0px;white-space:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;text-decoration-styl=
e:initial;text-decoration-color:initial"><font color=3D"#000000" size=3D"2"=
>The conference will be in a hybrid format (in-Person and Virtual).</font><=
/p><p align=3D"justify" style=3D"color:rgb(96,96,96);text-transform:none;te=
xt-indent:0px;letter-spacing:normal;font-family:Arial,sans-serif;font-size:=
14px;font-style:normal;font-weight:400;word-spacing:0px;white-space:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;text-decoration-styl=
e:initial;text-decoration-color:initial"><font color=3D"#000000" size=3D"2"=
>Main conference and Special Sessions =C2=A0Proceedings will be published w=
ith<strong><span>=C2=A0</span><font color=3D"#f04e00">Springer in their Com=
munications in Computer and Information Science series (CCIS)</font></stron=
g><span>=C2=A0</span>with Springer. CCIS is abstracted/indexed in DBLP, Goo=
gle Scholar, EI-Compendex, SCImago, Scopus. CCIS volumes are also submitted=
 for inclusion in ISI Proceedings.=C2=A0Last<span>=C2=A0</span><a style=3D"=
color:rgb(17,85,204)" href=3D"https://link.springer.com/conference/artiis" =
target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goog=
le.com/url?hl=3Den&amp;q=3Dhttps://link.springer.com/conference/artiis&amp;=
source=3Dgmail&amp;ust=3D1712531440778000&amp;usg=3DAOvVaw3FmbpRW7vI86Emug7=
Dzhtr">ARTIIS CCIS Proceedings</a>.</font></p><p align=3D"justify" style=3D=
"color:rgb(96,96,96);text-transform:none;text-indent:0px;letter-spacing:nor=
mal;font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-weig=
ht:400;word-spacing:0px;white-space:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;text-decoration-style:initial;text-decoration-color:=
initial"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D=
"2"><span style=3D"text-align:center;color:rgb(33,37,41);text-transform:non=
e;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-si=
ze:12px;font-style:normal;font-weight:400;word-spacing:0px;float:none;displ=
ay:inline!important;white-space:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"text-align:center;color:rgb(33,37,41);text-transform:no=
ne;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-s=
ize:9pt;font-style:normal;font-variant:normal;font-weight:400;word-spacing:=
0px;vertical-align:baseline;white-space:normal;box-sizing:border-box;text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"text-=
align:center;color:rgb(33,37,41);text-transform:none;text-indent:0px;letter=
-spacing:normal;font-family:Lato,sans-serif;font-size:9pt;font-style:normal=
;font-variant:normal;font-weight:400;word-spacing:0px;vertical-align:baseli=
ne;white-space:normal;box-sizing:border-box;text-decoration-style:initial;t=
ext-decoration-color:initial"><font color=3D"#000000"><font color=3D"#00000=
0" size=3D"2">Submitted papers should be related to one or more of the main=
 themes proposed.</font></font></span></span></span></font></font></p><bloc=
kquote style=3D"color:rgb(96,96,96);text-transform:none;text-indent:0px;let=
ter-spacing:normal;font-family:Arial,sans-serif;font-size:14px;font-style:n=
ormal;font-weight:400;margin-right:0px;word-spacing:0px;white-space:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;text-decoration-styl=
e:initial;text-decoration-color:initial" dir=3D"ltr"><p align=3D"justify"><=
font color=3D"#000000" size=3D"2"><font size=3D"2"><font color=3D"#000000">=
<strong>1. Computing Solutions</strong><br>- Applied Information Systems (e=
. g. Healthcare, Law, Economics, Education)<br>- Web and Mobile Application=
s<br>- Networks, Mobility, Ubiquity and Pervasive Systems<br>- Innovative C=
omputing<br>- Gamification Application and Technologies<br>- Software Engin=
eering</font></font></font></p><p align=3D"left"><font color=3D"#000000" si=
ze=3D"2"><font size=3D"2"><font color=3D"#000000"><strong>2. Data Intellige=
nce</strong><br>- Advanced Computational Intelligence<br>- Computer Vision =
and Image Processing<br>- Artificial Intelligence and Data Science<br>- Dat=
a Engineering, Analytics, and Applications<br>- Intelligent and Decision Su=
pport Systems<br>- Information and Knowledge Management</font></font></font=
></p><p align=3D"justify"><font color=3D"#000000" size=3D"2"><font size=3D"=
2"><font color=3D"#000000"><strong>3. Sustainability</strong><br>- Immersiv=
e Tech and the Future of Smart Cities<br>- Industrial Advanced Internet of =
Things<br>- Internet of Things Environment<br>- Sustainable Infrastructure =
Development<br>- Technology, Marketing and Socio-economic challenges</font>=
</font></font></p><p align=3D"justify"><font color=3D"#000000" size=3D"2"><=
font size=3D"2"><font color=3D"#000000"><strong>4. Ethics, Security, and Pr=
ivacy</strong><br>- Information and Telecommunication Systems Security<br>-=
 Innovative Communication Networks and Security<br>- Vulnerabilities of Int=
eroperability and Information system<br>- Interdisciplinary Information Stu=
dies<br>- Ethics of Social Sciences for Computer Applications</font></font>=
</font></p></blockquote><p align=3D"justify" style=3D"color:rgb(96,96,96);t=
ext-transform:none;text-indent:0px;letter-spacing:normal;font-family:Arial,=
sans-serif;font-size:14px;font-style:normal;font-weight:400;word-spacing:0p=
x;white-space:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;text-decoration-style:initial;text-decoration-color:initial"><font color=
=3D"#000000" size=3D"2"><font size=3D"2"><span style=3D"text-align:center;t=
ext-transform:none;text-indent:0px;letter-spacing:normal;font-family:Lato,s=
ans-serif;font-size:12px;font-style:normal;font-weight:400;word-spacing:0px=
;float:none;display:inline!important;white-space:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"text-align:center;text-transform:none;=
text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size=
:9pt;font-style:normal;font-variant:normal;font-weight:400;word-spacing:0px=
;vertical-align:baseline;white-space:normal;box-sizing:border-box;text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"text-ali=
gn:center;text-transform:none;text-indent:0px;letter-spacing:normal;font-fa=
mily:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:normal;fo=
nt-weight:400;word-spacing:0px;vertical-align:baseline;white-space:normal;b=
ox-sizing:border-box;text-decoration-style:initial;text-decoration-color:in=
itial"><font color=3D"#0000ff"><font color=3D"#000000" size=3D"2"><span sty=
le=3D"text-align:center;color:rgb(33,37,41);text-transform:none;text-indent=
:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size:12px;font-=
style:normal;font-weight:400;word-spacing:0px;float:none;display:inline!imp=
ortant;white-space:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"text-align:center;color:rgb(33,37,41);text-transform:none;text-inden=
t:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size:9pt;font-=
style:normal;font-variant:normal;font-weight:400;word-spacing:0px;vertical-=
align:baseline;white-space:normal;box-sizing:border-box;text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"text-align:center;=
color:rgb(33,37,41);text-transform:none;text-indent:0px;letter-spacing:norm=
al;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant=
:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;white-spac=
e:normal;box-sizing:border-box;text-decoration-style:initial;text-decoratio=
n-color:initial"><font color=3D"#000000"><font size=3D"2"><font color=3D"#0=
00000"><br></font></font></font></span></span></span></font></font></span><=
/span></span></font></font></p><p style=3D"color:rgb(96,96,96);text-transfo=
rm:none;text-indent:0px;letter-spacing:normal;font-family:Arial,sans-serif;=
font-size:14px;font-style:normal;font-weight:400;word-spacing:0px;white-spa=
ce:normal;font-variant-ligatures:normal;font-variant-caps:normal;text-decor=
ation-style:initial;text-decoration-color:initial"></p><p style=3D"color:rg=
b(96,96,96);text-transform:none;text-indent:0px;letter-spacing:normal;font-=
family:Arial,sans-serif;font-size:14px;font-style:normal;font-weight:400;wo=
rd-spacing:0px;white-space:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;text-decoration-style:initial;text-decoration-color:initial">=
<font color=3D"#000000">=C2=A0<font color=3D"#000000">=C2=A0<font size=3D"2=
"><strong>Beyond the Main Conference ARTIIS 2024=C2=A0there are several Spe=
cial Sessions</strong>:</font></font></font></p><ul style=3D"color:rgb(96,9=
6,96);text-transform:none;text-indent:0px;letter-spacing:normal;font-family=
:Arial,sans-serif;font-size:14px;font-style:normal;font-weight:400;word-spa=
cing:0px;white-space:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;text-decoration-style:initial;text-decoration-color:initial"><li st=
yle=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><strong>ACMaSDA=
 2024</strong>:<font color=3D"#000000" size=3D"2">Applications of Computati=
onal Mathematics to Simulation and Data Analysis</font></font></li><li styl=
e=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><font color=3D"#0=
00000" size=3D"2"><strong>CICITE<span>=C2=A0</span></strong><strong>2024</s=
trong>:Challenges and the Impact of ICT on Education</font></font></li><li =
style=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><font color=
=3D"#000000" size=3D"2"><strong>GAT<span>=C2=A0</span></strong><strong>2024=
</strong>: 2nd Workshop on Gamification Application and Technologies</font>=
</font></li><li style=3D"margin-left:15px"><font color=3D"#000000" size=3D"=
2"><strong>ISTIIS<span>=C2=A0</span></strong><strong>2024</strong><strong>:=
 International Symposium on Technological Innovations for Industry and Soci=
ety</strong></font></li><li style=3D"margin-left:15px"><font color=3D"#0000=
00" size=3D"2"><font color=3D"#000000" size=3D"2"><strong>ISHMC<span>=C2=A0=
</span></strong><strong>2024</strong>: Intelligent Systems for Health and M=
edical Care</font></font></li><li style=3D"margin-left:15px"><font color=3D=
"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><strong>SMARTTIS 20=
24</strong>: Smart Tourism and Information Systems</font></font></li><li st=
yle=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><font color=3D"=
#000000" size=3D"2"><strong>ET-AI 2024</strong>: Emergent Technologies and =
Artificial Intelligence</font></font></li><li style=3D"margin-left:15px"><f=
ont color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><font c=
olor=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><font color=
=3D"#000000" size=3D"2"><strong>IWET 2024</strong>: International Workshop =
on Electronic and Telecommunications</font></font></font></font></font></li=
><li style=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><font co=
lor=3D"#000000" size=3D"2"><strong>TechDiComM 2024</strong>: Technological =
Strategies on Digital Communication and Marketing</font></font></li><li sty=
le=3D"margin-left:15px"><font color=3D"#000000" size=3D"2"><font color=3D"#=
000000" size=3D"2"><strong>glossaLAB 2024:</strong><span>=C2=A0</span>Bridg=
ing Knowledge in a Fragmented World</font></font></li><li style=3D"margin-l=
eft:15px"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=
=3D"2"><strong>#RTNT=C2=A02024:</strong><span>=C2=A0</span>Emerging Technol=
ogies to Revitalize Tourism</font></font></li><li style=3D"margin-left:15px=
"><font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><st=
rong>CICT 2024</strong>: Cybersecurity in Information and Communication Tec=
hnologies</font></font></li><li style=3D"margin-left:15px"><font color=3D"#=
000000" size=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#00000=
0" size=3D"2"><font color=3D"#000000" size=3D"2"></font></font><font color=
=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><strong>WIN-WIN-=
4S 2024</strong>:=C2=A0Workshop on IoT Networks and Wireless for sustaINabi=
lity<br></font></font></font></font></li></ul><font color=3D"#000000" size=
=3D"2" style=3D"text-transform:none;text-indent:0px;letter-spacing:normal;f=
ont-family:Arial,sans-serif;font-style:normal;font-weight:400;word-spacing:=
0px;white-space:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;text-decoration-style:initial;text-decoration-color:initial"><font color=
=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2"><font color=3D"#=
000000" size=3D"2"><p align=3D"justify"><br></p><blockquote style=3D"margin=
-right:0px" dir=3D"ltr"><p align=3D"justify"><font color=3D"#0000ff" size=
=3D"2"><span style=3D"text-align:center;color:rgb(33,37,41);text-transform:=
none;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font=
-size:12px;font-style:normal;font-weight:400;word-spacing:0px;float:none;di=
splay:inline!important;white-space:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;text-decoration-style:initial;text-decoration-color:i=
nitial"><strong><font color=3D"#0000ff">Selected papers will be invited to =
publish an extended version in</font>:</strong></span></font></p></blockquo=
te><ul><li style=3D"margin-left:15px"><div align=3D"justify"><font size=3D"=
2"><span style=3D"text-align:center;text-transform:none;text-indent:0px;let=
ter-spacing:normal;font-family:Lato,sans-serif;font-size:12px;font-style:no=
rmal;font-weight:400;word-spacing:0px;float:none;display:inline!important;w=
hite-space:normal;font-variant-ligatures:normal;font-variant-caps:normal;te=
xt-decoration-style:initial;text-decoration-color:initial"><a style=3D"text=
-align:center;color:rgb(17,85,204);text-transform:none;text-indent:0px;lett=
er-spacing:normal;font-family:Lato,sans-serif;font-size:14.66px;font-style:=
normal;font-weight:400;text-decoration:none;word-spacing:0px;white-space:no=
rmal;box-sizing:border-box;font-variant-ligatures:none;font-variant-caps:no=
rmal" href=3D"https://www.springer.com/journal/42979" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://www.springer.com/journal/42979&amp;source=3Dgmail&amp;ust=3D1=
712531440778000&amp;usg=3DAOvVaw3mU3QIIppHEHq-U-r7APBN"><span style=3D"font=
-family:Lato,Arial;font-size:9pt;font-variant:normal;font-weight:700;text-d=
ecoration:underline;vertical-align:baseline;box-sizing:border-box"><font co=
lor=3D"#0000ff">SN Computer Science</font></span></a><span style=3D"text-al=
ign:center;text-transform:none;text-indent:0px;letter-spacing:normal;font-f=
amily:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:normal;f=
ont-weight:400;word-spacing:0px;vertical-align:baseline;white-space:normal;=
box-sizing:border-box;text-decoration-style:initial;text-decoration-color:i=
nitial"><font color=3D"#0000ff">, Springer and Nature</font></span></span><=
/font></div></li><li style=3D"margin-left:15px"><div align=3D"justify"><fon=
t size=3D"2"><span style=3D"text-align:center;text-transform:none;text-inde=
nt:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size:12px;fon=
t-style:normal;font-weight:400;word-spacing:0px;float:none;display:inline!i=
mportant;white-space:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"text-align:center;text-transform:none;text-indent:0px;letter-spaci=
ng:normal;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-=
variant:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;whi=
te-space:normal;box-sizing:border-box;text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"text-align:center;text-transform:non=
e;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-si=
ze:9pt;font-style:normal;font-variant:normal;font-weight:400;word-spacing:0=
px;vertical-align:baseline;white-space:normal;box-sizing:border-box;text-de=
coration-style:initial;text-decoration-color:initial"><font color=3D"#0000f=
f"><font color=3D"#000000" size=3D"2"><span style=3D"text-align:center;colo=
r:rgb(33,37,41);text-transform:none;text-indent:0px;letter-spacing:normal;f=
ont-family:Lato,sans-serif;font-size:12px;font-style:normal;font-weight:400=
;word-spacing:0px;float:none;display:inline!important;white-space:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"text-align:center;col=
or:rgb(33,37,41);text-transform:none;text-indent:0px;letter-spacing:normal;=
font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:no=
rmal;font-weight:400;word-spacing:0px;vertical-align:baseline;white-space:n=
ormal;box-sizing:border-box;text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"text-align:center;color:rgb(33,37,41);text-tra=
nsform:none;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-ser=
if;font-size:9pt;font-style:normal;font-variant:normal;font-weight:400;word=
-spacing:0px;vertical-align:baseline;white-space:normal;box-sizing:border-b=
ox;text-decoration-style:initial;text-decoration-color:initial"><font color=
=3D"#000000"><strong><u><a style=3D"color:rgb(17,85,204)" href=3D"https://w=
ww.mdpi.com/journal/computation" target=3D"_blank" rel=3D"nofollow" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://www.mdp=
i.com/journal/computation&amp;source=3Dgmail&amp;ust=3D1712531440778000&amp=
;usg=3DAOvVaw18Hl3VhncKdPPlGbOLtY28"><font color=3D"#0000ff" size=3D"2"><sp=
an style=3D"text-align:center;text-transform:none;text-indent:0px;letter-sp=
acing:normal;font-family:Lato,sans-serif;font-size:12px;font-style:normal;f=
ont-weight:400;word-spacing:0px;float:none;display:inline!important;white-s=
pace:normal;font-variant-ligatures:normal;font-variant-caps:normal;text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"text-al=
ign:center;text-transform:none;text-indent:0px;letter-spacing:normal;font-f=
amily:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:normal;f=
ont-weight:400;word-spacing:0px;vertical-align:baseline;white-space:normal;=
box-sizing:border-box;text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"text-align:center;text-transform:none;text-indent:0p=
x;letter-spacing:normal;font-family:Lato,sans-serif;font-size:9pt;font-styl=
e:normal;font-variant:normal;font-weight:400;word-spacing:0px;vertical-alig=
n:baseline;white-space:normal;box-sizing:border-box;text-decoration-style:i=
nitial;text-decoration-color:initial"><strong><u>Computation</u></strong></=
span></span></span></font></a></u></strong><font color=3D"#0000ff">, MDPI</=
font></font></span></span></span></font></font></span></span></span></font>=
</div></li><li style=3D"margin-left:15px"><div align=3D"justify"><font size=
=3D"2"><span style=3D"text-align:center;text-transform:none;text-indent:0px=
;letter-spacing:normal;font-family:Lato,sans-serif;font-size:12px;font-styl=
e:normal;font-weight:400;word-spacing:0px;float:none;display:inline!importa=
nt;white-space:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"text-align:center;text-transform:none;text-indent:0px;letter-spacing:no=
rmal;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-varia=
nt:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;white-sp=
ace:normal;box-sizing:border-box;text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"text-align:center;text-transform:none;tex=
t-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size:9p=
t;font-style:normal;font-variant:normal;font-weight:400;word-spacing:0px;ve=
rtical-align:baseline;white-space:normal;box-sizing:border-box;text-decorat=
ion-style:initial;text-decoration-color:initial"><font color=3D"#0000ff"><f=
ont color=3D"#000000" size=3D"2"><span style=3D"text-align:center;color:rgb=
(33,37,41);text-transform:none;text-indent:0px;letter-spacing:normal;font-f=
amily:Lato,sans-serif;font-size:12px;font-style:normal;font-weight:400;word=
-spacing:0px;float:none;display:inline!important;white-space:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"text-align:center;color:rg=
b(33,37,41);text-transform:none;text-indent:0px;letter-spacing:normal;font-=
family:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:normal;=
font-weight:400;word-spacing:0px;vertical-align:baseline;white-space:normal=
;box-sizing:border-box;text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"text-align:center;color:rgb(33,37,41);text-transfor=
m:none;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;fo=
nt-size:9pt;font-style:normal;font-variant:normal;font-weight:400;word-spac=
ing:0px;vertical-align:baseline;white-space:normal;box-sizing:border-box;te=
xt-decoration-style:initial;text-decoration-color:initial"><font color=3D"#=
000000"><font color=3D"#0000ff"><a style=3D"text-align:center;color:rgb(17,=
85,204);text-transform:none;text-indent:0px;letter-spacing:normal;font-fami=
ly:Lato,sans-serif;font-size:14.66px;font-style:normal;font-weight:400;text=
-decoration:none;word-spacing:0px;white-space:normal;box-sizing:border-box;=
font-variant-ligatures:none;font-variant-caps:normal" href=3D"https://l.fac=
ebook.com/l.php?u=3Dhttps%3A%2F%2Feudl.eu%2Fjournal%2Fsc%3Ffbclid%3DIwAR0cN=
29XwFNcdbsI6V0ZEbSF6PY2MsJOGZAymgMCUEcCIObnOBfq1UK68O8&amp;h=3DAT3KIMbGL2Gx=
fHWsUCpYK4Y1ncg7Yxt_FbVwHSoOf7I7EQpp_68wfZYSfpoAL69BtFA0ojGQ1cLMACY9L0hM-YH=
PH5dqorfKP_iuzzXxC6qeER3GjsRvseOvGlFQB5jNepA" target=3D"_blank" rel=3D"nofo=
llow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://l.facebook.com/l.php?u%3Dhttps%253A%252F%252Feudl.eu%252Fjournal%252F=
sc%253Ffbclid%253DIwAR0cN29XwFNcdbsI6V0ZEbSF6PY2MsJOGZAymgMCUEcCIObnOBfq1UK=
68O8%26h%3DAT3KIMbGL2GxfHWsUCpYK4Y1ncg7Yxt_FbVwHSoOf7I7EQpp_68wfZYSfpoAL69B=
tFA0ojGQ1cLMACY9L0hM-YHPH5dqorfKP_iuzzXxC6qeER3GjsRvseOvGlFQB5jNepA&amp;sou=
rce=3Dgmail&amp;ust=3D1712531440778000&amp;usg=3DAOvVaw1etCuXjZqkh-BQ0Y18Jk=
f1"><span style=3D"font-family:Lato,Arial;font-size:9pt;font-variant:normal=
;font-weight:700;text-decoration:underline;vertical-align:baseline;box-sizi=
ng:border-box"><font color=3D"#0000ff">EAI Endorsed Transactions on Smart C=
ities</font></span></a><font color=3D"#0000ff"><span style=3D"text-align:ce=
nter;text-transform:none;text-indent:0px;letter-spacing:normal;font-family:=
Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:normal;font-we=
ight:400;word-spacing:0px;vertical-align:baseline;white-space:normal;box-si=
zing:border-box;text-decoration-style:initial;text-decoration-color:initial=
">, open access, peer-reviewed scholarly journal</span><span style=3D"text-=
align:center;text-transform:none;text-indent:0px;letter-spacing:normal;font=
-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-weight:400;wor=
d-spacing:0px;vertical-align:baseline;white-space:normal;box-sizing:border-=
box;font-variant-ligatures:none;font-variant-caps:normal;text-decoration-st=
yle:initial;text-decoration-color:initial">,=C2=A0</span><span style=3D"tex=
t-align:center;text-transform:none;text-indent:0px;letter-spacing:normal;fo=
nt-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant:norm=
al;font-weight:400;word-spacing:0px;vertical-align:baseline;white-space:nor=
mal;box-sizing:border-box;text-decoration-style:initial;text-decoration-col=
or:initial">EAI=C2=A0</span></font></font></font></span></span></span></fon=
t></font></span></span></span></font></div></li></ul><p align=3D"justify"><=
font size=3D"2"><span style=3D"text-align:center;text-transform:none;text-i=
ndent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font-size:12px;=
font-style:normal;font-weight:400;word-spacing:0px;float:none;display:inlin=
e!important;white-space:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"text-align:center;text-transform:none;text-indent:0px;letter-sp=
acing:normal;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;fo=
nt-variant:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;=
white-space:normal;box-sizing:border-box;text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"text-align:center;text-transform:=
none;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-serif;font=
-size:9pt;font-style:normal;font-variant:normal;font-weight:400;word-spacin=
g:0px;vertical-align:baseline;white-space:normal;box-sizing:border-box;text=
-decoration-style:initial;text-decoration-color:initial"><font color=3D"#00=
00ff"><font color=3D"#000000" size=3D"2"><span style=3D"text-align:center;c=
olor:rgb(33,37,41);text-transform:none;text-indent:0px;letter-spacing:norma=
l;font-family:Lato,sans-serif;font-size:12px;font-style:normal;font-weight:=
400;word-spacing:0px;float:none;display:inline!important;white-space:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"text-align:center;=
color:rgb(33,37,41);text-transform:none;text-indent:0px;letter-spacing:norm=
al;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-variant=
:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;white-spac=
e:normal;box-sizing:border-box;text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"text-align:center;color:rgb(33,37,41);text-=
transform:none;text-indent:0px;letter-spacing:normal;font-family:Lato,sans-=
serif;font-size:9pt;font-style:normal;font-variant:normal;font-weight:400;w=
ord-spacing:0px;vertical-align:baseline;white-space:normal;box-sizing:borde=
r-box;text-decoration-style:initial;text-decoration-color:initial"><font co=
lor=3D"#000000"><font color=3D"#0000ff"><font color=3D"#0000ff"><span style=
=3D"text-align:center;text-transform:none;text-indent:0px;letter-spacing:no=
rmal;font-family:Lato,sans-serif;font-size:9pt;font-style:normal;font-varia=
nt:normal;font-weight:400;word-spacing:0px;vertical-align:baseline;white-sp=
ace:normal;box-sizing:border-box;text-decoration-style:initial;text-decorat=
ion-color:initial"><br></span></font></font></font></span></span></span></f=
ont></font></span></span></span></font></p></font></font></font></font></fo=
nt><p style=3D"color:rgb(96,96,96);text-transform:none;text-indent:0px;lett=
er-spacing:normal;font-family:Arial,sans-serif;font-size:14px;font-style:no=
rmal;font-weight:400;word-spacing:0px;white-space:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;text-decoration-style:initial;text-dec=
oration-color:initial"><font color=3D"#0c7423"><strong>We are waiting for y=
ou!</strong></font></p><font size=3D"2" style=3D"color:rgb(96,96,96);text-t=
ransform:none;text-indent:0px;letter-spacing:normal;font-family:Arial,sans-=
serif;font-style:normal;font-weight:400;word-spacing:0px;white-space:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;text-decoration-sty=
le:initial;text-decoration-color:initial"><p><font size=3D"2"></font></p><p=
><font size=3D"2"><br><font color=3D"#000000">For more information Artiis.o=
rg</font></font></p><p></p><p></p></font><p style=3D"color:rgb(96,96,96);te=
xt-transform:none;text-indent:0px;letter-spacing:normal;font-family:Arial,s=
ans-serif;font-size:14px;font-style:normal;font-weight:400;word-spacing:0px=
;white-space:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
text-decoration-style:initial;text-decoration-color:initial"><br><font colo=
r=3D"#000000" size=3D"2">Kind Regards</font></p><p align=3D"right" style=3D=
"color:rgb(96,96,96);text-transform:none;text-indent:0px;letter-spacing:nor=
mal;font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-weig=
ht:400;word-spacing:0px;white-space:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;text-decoration-style:initial;text-decoration-color:=
initial"></p><p style=3D"color:rgb(96,96,96);text-transform:none;text-inden=
t:0px;letter-spacing:normal;font-family:Arial,sans-serif;font-size:14px;fon=
t-style:normal;font-weight:400;word-spacing:0px;white-space:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;text-decoration-style:initia=
l;text-decoration-color:initial"><font color=3D"#000000" size=3D"2">ARTIIS =
Team<font color=3D"#000000" size=3D"2"><font color=3D"#000000" size=3D"2">=
=C2=A0</font></font></font></p></td></tr><tr><td width=3D"430" align=3D"lef=
t" valign=3D"top" style=3D"margin:0px;padding:0px;border:0px currentColor;w=
idth:430px;border-collapse:collapse;border-spacing:0;background-color:rgb(2=
55,255,255)" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0"><font color=3D"#000000" size=3D"2">
													=09
														=09
															=09
																	</font>
													</td>
												</tr>
											=09
											=09
											=09
											=09
											=09
											=09
												<tr>
												=09
													<td width=3D"430" height=3D"20" style=3D"margin:0px;padding:0p=
x;border:0px currentColor;width:430px;height:20px;border-collapse:collapse;=
border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	</td>
												</tr>
												<tr>
												=09
													<td width=3D"430" align=3D"left" valign=3D"top" style=3D"margi=
n:0px;padding:0px;border:0px currentColor;width:430px;border-collapse:colla=
pse;border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
														<table width=3D"410" align=3D"right" style=3D"margin:0px;padd=
ing:0px;border:0px currentColor;width:410px;border-collapse:collapse;border=
-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#fffff" border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" valign=3D"top">
															<tbody>
																<tr>
																	<td width=3D"410" align=3D"left" valign=3D"top" style=3D"m=
argin:0px;padding:0px;border:0px currentColor;width:410px;border-collapse:c=
ollapse;border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#fff=
fff" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><span style=3D"margin=
:0px;padding:0px;color:rgb(40,40,40);text-transform:uppercase;line-height:2=
4px;font-family:Arial,sans-serif;font-size:20px"><a style=3D"margin:0px;pad=
ding:0px;color:rgb(40,40,40);text-transform:uppercase;line-height:24px;font=
-family:Arial,sans-serif;font-size:20px;text-decoration:none" rel=3D"nofoll=
ow"><span style=3D"margin:0px;padding:0px;color:rgb(40,40,40);text-transfor=
m:uppercase;line-height:24px;font-family:Arial,sans-serif;font-size:20px">=
=C2=A0</span></a></span>
																		<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255)=
;line-height:10px;font-family:Arial,sans-serif;font-size:10px">
																			=C2=A0
																		</p>
																		<table width=3D"130" align=3D"left" style=3D"margin:0px;p=
adding:0px;border:0px currentColor;width:130px;border-collapse:collapse;bor=
der-spacing:0;background-color:rgb(130,176,4)" bgcolor=3D"#82b004" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0">
																			<tbody>
																				<tr>
																					<td width=3D"130" align=3D"center" style=3D"margin:0px=
;padding:0px;border:0px currentColor;width:130px;border-collapse:collapse;b=
order-spacing:0;background-color:rgb(130,176,4)" bgcolor=3D"#82b004" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0">
																						<p align=3D"center" style=3D"margin:0px;padding:0px;c=
olor:rgb(255,255,255);text-transform:uppercase;line-height:10px;font-family=
:Arial,sans-serif;font-size:10px">
<br></p><p align=3D"center" style=3D"margin:0px;padding:0px;color:rgb(255,2=
55,255);text-transform:uppercase;line-height:10px;font-family:Arial,sans-se=
rif;font-size:10px">website <a href=3D"https://www.artiis.org/about" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://www.artiis.org/about&amp;source=3Dgmail&amp;us=
t=3D1712531440778000&amp;usg=3DAOvVaw02mu8eivp4gEI60bfxiDQt"><strong><em><f=
ont color=3D"#ffffff">ARTIIS.ORG</font></em></strong></a></p><p style=3D"ma=
rgin:0px;padding:0px;color:rgb(255,255,255);text-transform:uppercase;line-h=
eight:10px;font-family:Arial,sans-serif;font-size:10px">=C2=A0</p>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
												=09
													<td width=3D"430" height=3D"50" style=3D"margin:0px;padding:0p=
x;border:0px currentColor;width:430px;height:50px;border-collapse:collapse;=
border-spacing:0;background-color:rgb(255,255,255)" bgcolor=3D"#ffffff" bor=
der=3D"0" cellspacing=3D"0" cellpadding=3D"0">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0	</td>
												</tr>
											=09
											=09
											</tbody>
										</table>
									</td>
								</tr>
							=09
							=09
								<tr>
									<td width=3D"640" align=3D"center" style=3D"margin:0px;padding:0px=
;border:0px currentColor;width:640px;border-collapse:collapse;border-spacin=
g:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0">
										<table width=3D"600" align=3D"center" style=3D"margin:0px;padding=
:0px;border:0px currentColor;width:600px;border-collapse:collapse;border-sp=
acing:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0">
											<tbody>
												<tr>
													<td width=3D"300" align=3D"left" style=3D"margin:0px;padding:0=
px;border:0px currentColor;width:300px;border-collapse:collapse;border-spac=
ing:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	</p>
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
														</p>
													</td>
													<td width=3D"300" align=3D"right" style=3D"margin:0px;padding:=
0px;border:0px currentColor;width:300px;border-collapse:collapse;border-spa=
cing:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0">
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0	<a style=3D"margin:0px;padding:0px;color:rgb(229,132,9);line-height:18p=
x;font-family:Arial,sans-serif;font-size:16px;text-decoration:none" rel=3D"=
nofollow"></a>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0	<a style=3D"margin:0px;padding:0px;color:rgb(229,132,9);lin=
e-height:18px;font-family:Arial,sans-serif;font-size:16px;text-decoration:n=
one" rel=3D"nofollow"></a>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0	<a style=3D"margin:0px;padding:0px;color:rgb(229,132,9);lin=
e-height:18px;font-family:Arial,sans-serif;font-size:16px;text-decoration:n=
one" rel=3D"nofollow"></a>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0	<a style=3D"margin:0px;padding:0px;color:rgb(229,132,9);lin=
e-height:18px;font-family:Arial,sans-serif;font-size:16px;text-decoration:n=
one" rel=3D"nofollow"></a>
													</td>
												</tr>
												<tr>
													<td width=3D"600" align=3D"center" style=3D"margin:0px;padding=
:0px;border:0px currentColor;width:600px;border-collapse:collapse;border-sp=
acing:0;background-color:rgb(56,56,56)" bgcolor=3D"#383838" colspan=3D"2" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0">
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
														</p>
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:16px;font-family:Arial,sans-serif;font-size:14px"><font size=3D"2"=
>
															You can <a href data-email-masked rel=3D"nofollow">Unsubscri=
be by email</a> from this mailing list</font>
														</p>
														<p style=3D"margin:0px;padding:0px;color:rgb(255,255,255);lin=
e-height:10px;font-family:Arial,sans-serif;font-size:10px">
															=C2=A0
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							=09
							</tbody>
						</table>
					=09
					</td>
				</tr>
			</tbody>
		</table>
=09
</div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c18dff65-3ac9-45fe-abee-5ff7084524c1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c18dff65-3ac9-45fe-abee-5ff7084524c1n%40googlegroups.co=
m</a>.<br />

------=_Part_258931_79556839.1712445131074--

------=_Part_258930_904872681.1712445131074--
